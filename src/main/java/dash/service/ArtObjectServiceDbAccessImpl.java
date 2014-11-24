package dash.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.transaction.annotation.Transactional;

import dash.dao.ArtObjectDao;
import dash.dao.ArtObjectEntity;
import dash.errorhandling.AppException;
import dash.filters.AppConstants;
import dash.helpers.NullAwareBeanUtilsBean;
import dash.pojo.ArtObject;
import dash.pojo.SampleObject;
import dash.security.CustomPermission;
import dash.security.GenericAclController;


public class ArtObjectServiceDbAccessImpl extends ApplicationObjectSupport implements
ArtObjectService {

	@Autowired
	ArtObjectDao artObjectDao;

	@Autowired
	private MutableAclService mutableAclService;

	@Autowired
	private GenericAclController<ArtObject> aclController;


	/********************* Create related methods implementation ***********************/
	@Override
	@Transactional
	public Long createArtObject(ArtObject artObject) throws AppException {

		validateInputForCreation(artObject);

		//verify existence of resource in the db (feed must be unique)
		ArtObjectEntity artObjectByTitle = artObjectDao.getArtObjectByTitle(artObject.getTitle());
		if (artObjectByTitle != null) {
			throw new AppException(
					Response.Status.CONFLICT.getStatusCode(),
					409,
					"Object with name already existing in the database with the id "
							+ artObjectByTitle.getArtwork_id(),
							"Please verify that the name are properly generated",
							AppConstants.DASH_POST_URL);
		}

		long artObjectId = artObjectDao.createArtObject(new ArtObjectEntity(artObject));
		artObject.setArtwork_id(artObjectId);
		
		aclController.createACL(artObject);
		aclController.createAce(artObject, CustomPermission.READ);
		aclController.createAce(artObject, CustomPermission.WRITE);
		aclController.createAce(artObject, CustomPermission.DELETE);
		
		return artObjectId;
	}

	private void validateInputForCreation(ArtObject artObject) throws AppException {
		if (artObject.getTitle() == null) {
			throw new AppException(Response.Status.BAD_REQUEST.getStatusCode(), 400, "Provided data not sufficient for insertion",
					"Please verify that the title is properly generated/set",
					AppConstants.DASH_POST_URL);
		}				
	}

		// ******************** Read related methods implementation **********************
	@Override
	public List<ArtObject> getArtObjects(String orderByTitle) throws AppException {

		if(isorderByTitleParameterValid(orderByTitle)){
			throw new AppException(
					Response.Status.BAD_REQUEST.getStatusCode(),
					400,
					"Please set either ASC or DESC for the orderByTitle parameter",
					null, AppConstants.DASH_POST_URL);
		}
		List<ArtObjectEntity> artObjects = artObjectDao.getArtObjects(orderByTitle);

		return getArtObjectsFromEntities(artObjects);
	}

	private boolean isorderByTitleParameterValid(
			String orderByTitle) {
		return orderByTitle!=null
				&& !("ASC".equalsIgnoreCase(orderByTitle) || "DESC".equalsIgnoreCase(orderByTitle));
	}

	@Override
	public ArtObject getArtObjectById(Long id) throws AppException {
		ArtObjectEntity artObjectById = artObjectDao.getArtObjectById(id);
		if (artObjectById == null) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The object you requested with id " + id
					+ " was not found in the database",
					"Verify the existence of the object with the id " + id
					+ " in the database", AppConstants.DASH_POST_URL);
		}

		return new ArtObject(artObjectDao.getArtObjectById(id));
	}

	private List<ArtObject> getArtObjectsFromEntities(List<ArtObjectEntity> artObjectEntities) {
		List<ArtObject> response = new ArrayList<ArtObject>();
		for (ArtObjectEntity artObjectEntity : artObjectEntities) {
			response.add(new ArtObject(artObjectEntity));
		}

		return response;
	}
	
	

	/********************* UPDATE-related methods implementation ***********************/
	@Override
	@Transactional
	public void updateFullyArtObject(ArtObject artObject) throws AppException {
		//do a validation to verify FULL update with PUT
		if (isFullUpdate(artObject)) {
			throw new AppException(Response.Status.BAD_REQUEST.getStatusCode(),
					400,
					"Please specify all properties for Full UPDATE",
					"required properties - name",
					AppConstants.DASH_POST_URL);
		}

		ArtObject verifyArtObjectExistenceById = verifyArtObjectExistenceById(artObject
				.getId());
		if (verifyArtObjectExistenceById == null) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ artObject.getId(),
							AppConstants.DASH_POST_URL);
		}

		artObjectDao.updateArtObject(new ArtObjectEntity(artObject));
	}

	/**
	 * Verifies the "completeness" of art object resource sent over the wire
	 *
	 * @param ArtObject
	 * @return
	 */
	private boolean isFullUpdate(ArtObject artObject) {
		return artObject.getId() == null
				|| artObject.getTitle() == null;
	}

	/********************* DELETE-related methods implementation ***********************/

	@Override
	@Transactional
	public void deleteArtObject(ArtObject artObject) {

		artObjectDao.deleteArtObject(artObject);
		aclController.deleteACL(artObject);

	}

	@Override
	@Transactional
	// TODO: This shouldn't exist? If it must, then it needs to accept a list of
	// Art Objects to delete
	public void deleteArtObjects() {
		artObjectDao.deleteArtObjects();
	}

	@Override
	// TODO: This doesn't need to exist. It is the exact same thing as
	// getArtObjectById(Long)
	public ArtObject verifyArtObjectExistenceById(Long id) {
		ArtObjectEntity artObjectById = artObjectDao.getArtObjectById(id);
		if (artObjectById == null) {
			return null;
		} else {
			return new ArtObject(artObjectById);
		}
	}

	@Override
	@Transactional
	public void updatePartiallyArtObject(ArtObject artObject) throws AppException {
		//do a validation to verify existence of the resource
		ArtObject verifyArtObjectExistenceById = verifyArtObjectExistenceById(artObject.getId());
		if (verifyArtObjectExistenceById == null) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ artObject.getId(), AppConstants.DASH_POST_URL);
		}
		copyPartialProperties(verifyArtObjectExistenceById, artObject);
		artObjectDao.updateArtObject(new ArtObjectEntity(verifyArtObjectExistenceById));

	}

	private void copyPartialProperties(ArtObject verifyArtObjectExistenceById, ArtObject artObject) {

		BeanUtilsBean notNull=new NullAwareBeanUtilsBean();
		try {
			notNull.copyProperties(verifyArtObjectExistenceById, artObject);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	/************************
	****** Upload File ******
	************************/
	
	public void uploadFile(InputStream uploadedInputStream,
			String uploadedFileLocation)
			throws AppException {

		try {
			File file = new File(uploadedFileLocation);
			file.getParentFile().mkdirs();
			
			if(!file.getParentFile().exists()){
				throw new IOException("The directory was not created");
			}
			
			OutputStream out = new FileOutputStream(file);
			int read = 0;
			byte[] bytes = new byte[1024];

			out = new FileOutputStream(new File(uploadedFileLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {

			throw new AppException(
					Response.Status.INTERNAL_SERVER_ERROR.getStatusCode(), 500,
					"Could not upload file due to IOException", "\n\n"
							+ e.getMessage(), AppConstants.DASH_POST_URL);
		}

	}

	public File getUploadFile(String uploadedFileLocation) throws AppException {
		return new File(uploadedFileLocation);
	}
	
	@Override
	public List<String> getFileNames(ArtObject artObject) {
		List<String> results = new ArrayList<String>();
		
		File[] files = new File(AppConstants.APPLICATION_UPLOAD_LOCATION_FOLDER+"/" + artObject.getId()).listFiles();
		//If this pathname does not denote a directory, then listFiles() returns null. 

		if(files != null){
			for (File file : files) {
			    if (file.isFile()) {
			        results.add(file.getName());
			    }
			}
		}
		return results;
	}
	
	@Override
	public void deleteUploadFile(String uploadedFileLocation) throws AppException {
		Path path = Paths.get(uploadedFileLocation);
		try {
		    Files.delete(path);
		} catch (NoSuchFileException x) {
			x.printStackTrace();
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"NoSuchFileException thrown, Operation unsuccesful.", "Please ensure the file you are attempting to"
					+ " delete exists at "+path+".", AppConstants.DASH_POST_URL);
			
					
		} catch (DirectoryNotEmptyException x) {
			x.printStackTrace();
			throw new AppException(Response.Status.INTERNAL_SERVER_ERROR.getStatusCode(),
					404,
					"DirectoryNotEmptyException thrown, operation unsuccesful.", "This method should not attempt to delete,"
							+ " This should be considered a very serious error. Occured at "+path+".",
					AppConstants.DASH_POST_URL);
		} catch (IOException x) {
			x.printStackTrace();
			throw new AppException(Response.Status.INTERNAL_SERVER_ERROR.getStatusCode(),
					500,
					"IOException thrown and the designated file was not deleted.", 
					" Permission problems occured at "+path+".",
					AppConstants.DASH_POST_URL);
		}
		
	}

}
