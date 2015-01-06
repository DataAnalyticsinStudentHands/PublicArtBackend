package dash.dao;

import java.util.List;

public interface TourDao {
	
	public List<TourEntity> getTours(String orderByTitle);

	public TourEntity getTourByTitle(String title);
	
	public Long createTour(TourEntity tour);
}
