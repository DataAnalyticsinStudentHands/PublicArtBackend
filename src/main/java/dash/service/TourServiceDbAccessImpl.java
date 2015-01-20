package dash.service;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ApplicationObjectSupport;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.transaction.annotation.Transactional;

import javax.ws.rs.core.Response;

import dash.dao.TourDao;
import dash.dao.TourEntity;
import dash.errorhandling.AppException;
import dash.filters.AppConstants;
import dash.helpers.NullAwareBeanUtilsBean;
import dash.pojo.Tour;
import dash.security.CustomPermission;
import dash.security.GenericAclController;

import java.util.ArrayList;

public class TourServiceDbAccessImpl extends ApplicationObjectSupport implements TourService{

	@Autowired
	TourDao tourDao;

	@Autowired
	private MutableAclService mutableAclService;

	@Autowired
	private GenericAclController<Tour> aclController;
	
	@Override
	@Transactional
	public Long createTour(Tour tour) throws AppException {

		validateInputForCreation(tour);

		//verify existence of resource in the db (feed must be unique)
		TourEntity tourByTitle = tourDao.getTourByTitle(tour.getTour_title());
		if (tourByTitle != null) {
			throw new AppException(
					Response.Status.CONFLICT.getStatusCode(),
					409,
					"Object with name already existing in the database with the id "
							+ tourByTitle.getTour_id(),
							"Please verify that the name are properly generated",
							AppConstants.DASH_POST_URL);
		}

		long tourId = tourDao.createTour(new TourEntity(tour));
		tour.setTour_id(tourId);
		
		aclController.createACL(tour);
		aclController.createAce(tour, CustomPermission.READ);
		aclController.createAce(tour, CustomPermission.WRITE);
		aclController.createAce(tour, CustomPermission.DELETE);
		
		return tourId;
	}
	
	private void validateInputForCreation(Tour tour) throws AppException {
		if (tour.getTour_title() == null) {
			throw new AppException(Response.Status.BAD_REQUEST.getStatusCode(), 400, "Provided data not sufficient for insertion",
					"Please verify that the title is properly generated/set",
					AppConstants.DASH_POST_URL);
		}				
	}

	@Override
	public List<Tour> getTours(String orderByTitle, String updated) throws AppException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
		Date dUpdated = null;
		
		if(updated!=null){
			try {
				
				dUpdated = sdf.parse(updated);
			} catch (ParseException e) {
				
				e.printStackTrace();
				
				throw new AppException(
					Response.Status.INTERNAL_SERVER_ERROR.getStatusCode(), 500,
					"'updated' param " + updated + " not parseable", "\n\n"
							+ e.getMessage(), AppConstants.DASH_POST_URL);
			}
		}
		
		
		
		if(isorderByTitleParameterValid(orderByTitle)){
			throw new AppException(
					Response.Status.BAD_REQUEST.getStatusCode(),
					400,
					"Please set either ASC or DESC for the orderByTitle parameter",
					null, AppConstants.DASH_POST_URL);
		}
		List<TourEntity> tours = tourDao.getTours(orderByTitle, dUpdated);
		
		if(tours!=null){
			
			return getToursFromEntities(tours);
		}
		else{
			
			throw new AppException(
					Response.Status.NOT_MODIFIED.getStatusCode(),
					304,
					"Tours are up-to-date",
					null, AppConstants.DASH_POST_URL);
		}
	}
	
	private boolean isorderByTitleParameterValid(
			String orderByTitle) {
		return orderByTitle!=null
				&& !("ASC".equalsIgnoreCase(orderByTitle) || "DESC".equalsIgnoreCase(orderByTitle));
	}
	
	private List<Tour> getToursFromEntities(List<TourEntity> tourEntities) {
		List<Tour> response = new ArrayList<Tour>();
		for (TourEntity tourEntity : tourEntities) {
			response.add(new Tour(tourEntity));
		}

		return response;
	}
	
	@Override
	@Transactional
	public void deleteTour(Tour tour) {

		tourDao.deleteTour(tour);
		aclController.deleteACL(tour);

	}
	
	@Override
	@Transactional
	public void updatePartiallyTour(Tour tour) throws AppException {
		//do a validation to verify existence of the resource
		Tour verifyTourExistenceById = verifyTourExistenceById(tour.getId());
		if (verifyTourExistenceById == null) {
			throw new AppException(Response.Status.NOT_FOUND.getStatusCode(),
					404,
					"The resource you are trying to update does not exist in the database",
					"Please verify existence of data in the database for the id - "
							+ tour.getId(), AppConstants.DASH_POST_URL);
		}
		copyPartialProperties(verifyTourExistenceById, tour);
		tourDao.updateTour(new TourEntity(verifyTourExistenceById));

	}
	
	@Override
	// TODO: This doesn't need to exist. It is the exact same thing as
	// getArtObjectById(Long)
	public Tour verifyTourExistenceById(Long id) {
		TourEntity tourById = tourDao.getTourById(id);
		if (tourById == null) {
			return null;
		} else {
			return new Tour(tourById);
		}
	}
	
	private void copyPartialProperties(Tour verifyTourExistenceById, Tour tour) {

		BeanUtilsBean notNull=new NullAwareBeanUtilsBean();
		try {
			notNull.copyProperties(verifyTourExistenceById, tour);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
