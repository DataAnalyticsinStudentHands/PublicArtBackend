package dash.dao;

import java.util.List;
import dash.pojo.Tour;

public interface TourDao {
	
	public List<TourEntity> getTours(String orderByTitle);

	public TourEntity getTourByTitle(String title);
	
	public Long createTour(TourEntity tour);
	
	public void deleteTour(Tour tour);
	
	public void updateTour(TourEntity tour);
	
	public TourEntity getTourById(Long id);
}
