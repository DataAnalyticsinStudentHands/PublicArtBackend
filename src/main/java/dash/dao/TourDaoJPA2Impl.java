package dash.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import dash.pojo.Tour;

public class TourDaoJPA2Impl implements TourDao {

	@PersistenceContext(unitName = "dashPersistence")
	private EntityManager entityManager;
	
	@Override
	public List<TourEntity> getTours(String orderByTitle) {
		String sqlString = null;
		if(orderByTitle != null){
			sqlString = "SELECT o FROM TourEntity o"
					+ " ORDER BY o.tour_title " + orderByTitle;
		} else {
			sqlString = "SELECT o FROM TourEntity o";
		}
		TypedQuery<TourEntity> query = entityManager.createQuery(sqlString,
				TourEntity.class);

		return query.getResultList();
	}

	@Override
	public TourEntity getTourByTitle(String title) {

		try {
			String qlString = "SELECT o FROM TourEntity o WHERE o.tour_title = ?1";
			TypedQuery<TourEntity> query = entityManager.createQuery(qlString,
					TourEntity.class);
			query.setParameter(1, title);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Long createTour(TourEntity tour) {

		entityManager.persist(tour);
		entityManager.flush();// force insert to receive the id of the user

		// Give admin over new user to the new user
		return tour.getTour_id();
	}

	@Override
	public void deleteTour(Tour tourPojo) {

		TourEntity tour = entityManager
				.find(TourEntity.class, tourPojo.getId());
		entityManager.remove(tour);
	}
	
	@Override
	public void updateTour(TourEntity tour) {
		//TODO think about partial update and full update
		entityManager.merge(tour);
	}
	
	@Override
	public TourEntity getTourById(Long id) {

		try {
			String qlString = "SELECT o FROM TourEntity o WHERE o.tour_id = ?1";
			TypedQuery<TourEntity> query = entityManager.createQuery(qlString,
					TourEntity.class);
			query.setParameter(1, id);

			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
