package dash.service;

import java.io.InputStream;
import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;

import dash.errorhandling.AppException;
import dash.pojo.ArtObject;

public interface ArtObjectService {
	/*
	 * ******************** Create related methods **********************
	 *
	 *Create a new art object and set the current user as owner and manager.
	 */
	public Long createArtObject(ArtObject artObject) throws AppException;

	@PreAuthorize("hasRole('ROLE_ROOT')")
	public void createArtObjects(List<ArtObject> artObject) throws AppException;
	
	@PreAuthorize("hasPermission(#smapleObject, 'write') or hasRole('ROLE_ADMIN')")
	public void uploadFile(InputStream uploadedInputStream,
			String uploadedFileLocation) throws AppException;

	/*
	 * ******************* Read related methods ********************
	 */
	/**
	 *
	 * @param orderByTitle
	 *            - if set, it represents the order by criteria (ASC or DESC)
	 *            for displaying objects
	 * @return list with objects corresponding to search criteria
	 * @throws AppException
	 */
	
	public List<ArtObject> getArtObjects(String orderByTitle, String updated) throws AppException;

	/**
	 * Returns a art object given its id
	 *
	 * @param id
	 * @return
	 * @throws AppException
	 */
	
	public ArtObject getArtObjectById(Long id) throws AppException;
	
	/*
	 * ******************** Update related methods **********************
	 */
	@PreAuthorize("hasPermission(#user, 'WRITE') or hasRole('ROLE_ADMIN')")
	public void updateFullyArtObject(ArtObject artObject) throws AppException;

	@PreAuthorize("hasPermission(#user, 'WRITE') or hasRole('ROLE_ADMIN')")
	public void updatePartiallyArtObject(ArtObject artObject) throws AppException;
	
	/*
	 * ******************** Delete related methods **********************
	 */
	@PreAuthorize("hasPermission(#user, 'DELETE') or hasRole('ROLE_ADMIN')")
	public void deleteArtObject(ArtObject artObject);
	
	/** removes all artobjects
	 * DO NOT USE, IMPROPERLY UPDATES ACL_OBJECT table
	 * Functional but does not destroy old acl's which doesnt hurt anything
	 * but they will take up space if this is commonly used */
	@PreAuthorize("hasRole('ROLE_ROOT')")
	public void deleteArtObjects();
	
	@PreAuthorize("hasPermission(#sampleObject, 'delete') or hasRole('ROLE_ADMIN')")
	public void deleteUploadFile(String uploadedFileLocation) throws AppException;

	/*
	 * ******************** Helper methods **********************
	 */
	// TODO: This also should not exist, or it should be changed to
	// private/protected. Redundant
	// Could be made a boolean so it was not a security vulnerability
	public ArtObject verifyArtObjectExistenceById(Long id);	
	
	@PreAuthorize("hasPermission(#artObject, 'read') or hasRole('ROLE_ADMIN')")
	public List<String> getFileNames(ArtObject artObject);

}
