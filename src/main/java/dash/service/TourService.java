package dash.service;

import dash.errorhandling.AppException;
import dash.pojo.Tour;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

public interface TourService {

	public Long createTour(Tour tour) throws AppException;
	
	public List<Tour> getTours(String orderByTitle, String updated) throws AppException;
	
	@PreAuthorize("hasPermission(#user, 'WRITE') or hasRole('ROLE_ADMIN')")
	public void updatePartiallyTour(Tour tour) throws AppException;
	
	@PreAuthorize("hasPermission(#user, 'DELETE') or hasRole('ROLE_ADMIN')")
	public void deleteTour(Tour tour);
	
	public Tour verifyTourExistenceById(Long id);	
}
