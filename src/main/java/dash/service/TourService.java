package dash.service;

import dash.errorhandling.AppException;
import dash.pojo.Tour;

import java.util.List;

public interface TourService {

	public Long createTour(Tour tour) throws AppException;
	
	public List<Tour> getTours(String orderByTitle) throws AppException;
}
