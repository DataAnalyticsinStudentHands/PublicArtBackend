package dash.service;

import java.lang.reflect.InvocationTargetException;
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

}
