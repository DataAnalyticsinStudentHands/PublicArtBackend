package dash.dao;

import java.util.List;

import dash.pojo.ArtObject;

/**
 *
 *
 * @see <a
 *      href="http://www.codingpedia.org/ama/spring-mybatis-integration-example/">http://www.codingpedia.org/ama/spring-mybatis-integration-example/</a>
 */
public interface ArtObjectDao {

	/**
	 *  List all art objects
	 *  @param orderByTitle If specified the list will be ordered by title.
	 *  @return The list of all art objects.
	 */
	public List<ArtObjectEntity> getArtObjects(String orderByTitle);

	/**
	 * Returns a art object given its id.
	 *
	 * @param id
	 * @return
	 */
	public ArtObjectEntity getArtObjectById(Long id);
	
	/**
	 * Find object by title
	 *
	 * @param object
	 * @return the object with the title specified or null if not existent
	 */
	public ArtObjectEntity getArtObjectByTitle(String title);

	/**
	 *  Delete an art objects
	 *  @param artObject The art object to be deleted.
	 */
	public void deleteArtObject(ArtObject artObject);

	/**
	 *  Create an art objects
	 *  @param artObject The art object entity to be create.
	 */
	public Long createArtObject(ArtObjectEntity artObject);

	/**
	 *  Updates an art objects
	 *  @param artObject The object with updated data.
	 */
	public void updateArtObject(ArtObjectEntity artObject);

	/**
	 *  Removes all art objects
	 *  
	 */
	public void deleteArtObjects();	

}
