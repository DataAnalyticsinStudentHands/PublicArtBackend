package dash.dao;

import java.util.List;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import dash.pojo.ArtObject;

public class ArtObjectDaoJPA2Impl implements
ArtObjectDao {

	@PersistenceContext(unitName = "dashPersistence")
	private EntityManager entityManager;

	@Override
	public List<ArtObjectEntity> getArtObjects(String orderByTitle, Date updated) {
		
		Date maxResult = entityManager.createQuery("SELECT o FROM ArtObjectEntity o WHERE o.last_update = (SELECT MAX(o.last_update) FROM ArtObjectEntity o)",
				ArtObjectEntity.class).setMaxResults(1).getSingleResult().getLast_update();
		
		//Date maxResult = maxQuery.getSingleResult().getLast_update();
		
		if(updated==null || maxResult.after(updated)){
		
			String sqlString = null;
			if(orderByTitle != null){
				sqlString = "SELECT o FROM ArtObjectEntity o"
						+ " ORDER BY o.title " + orderByTitle;
			} else {
				sqlString = "SELECT o FROM ArtObjectEntity o";
			}
			TypedQuery<ArtObjectEntity> query = entityManager.createQuery(sqlString,
					ArtObjectEntity.class);
	
			return query.getResultList();
		}
		else{
			
			return null;
		}
	}

	@Override
	public ArtObjectEntity getArtObjectById(Long id) {

		try {
			String qlString = "SELECT o FROM ArtObjectEntity o WHERE o.artwork_id = ?1";
			TypedQuery<ArtObjectEntity> query = entityManager.createQuery(qlString,
					ArtObjectEntity.class);
			query.setParameter(1, id);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	@Override
	public ArtObjectEntity getArtObjectByTitle(String title) {

		try {
			String qlString = "SELECT o FROM ArtObjectEntity o WHERE o.title = ?1";
			TypedQuery<ArtObjectEntity> query = entityManager.createQuery(qlString,
					ArtObjectEntity.class);
			query.setParameter(1, title);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void deleteArtObject(ArtObject artObjectPojo) {

		ArtObjectEntity artObject = entityManager
				.find(ArtObjectEntity.class, artObjectPojo.getId());
		entityManager.remove(artObject);
	}

	@Override
	public Long createArtObject(ArtObjectEntity artObject) {

		artObject.setLast_update(new Date());
		
		entityManager.persist(artObject);
		entityManager.flush();// force insert to receive the id of the user

		// Give admin over new user to the new user
		return artObject.getArtwork_id();
	}

	@Override
	public void updateArtObject(ArtObjectEntity artObject) {
		
		artObject.setLast_update(new Date());
		
		//TODO think about partial update and full update
		entityManager.merge(artObject);
	}

	@Override
	public void deleteArtObjects() {
		Query query = entityManager.createNativeQuery("TRUNCATE TABLE artobjects");
		query.executeUpdate();
	}

}
