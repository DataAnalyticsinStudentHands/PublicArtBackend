package dash.pojo;

import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Annotation;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dash.errorhandling.AppException;
import dash.filters.AppConstants;
import dash.service.TourService;

/**
*
* Service class that handles REST requests. This is where you define your API
* and what requests will be accepted.
*
* @author tyler.swensen@gmail.com
*
*/
@Component
@Path("/tours")
public class TourResource {

	@Autowired
	private TourService tourService;
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response createTour(Tour tour) throws AppException {
		Long createTourId = tourService.createTour(tour);
		return Response.status(Response.Status.CREATED)
				// 201
				.entity("A new tour has been created")
				.header("Location",
						"http://..../tours/"
								+ String.valueOf(createTourId)).build();
	}
	
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Tour> getTours(
			@QueryParam("orderByTitle") String orderByTitle, @QueryParam("updated") String updated)
					throws IOException,	AppException {
		List<Tour> tours = tourService.getTours(
				orderByTitle, updated);
		return tours;
	}
	
	@POST
	@Path("{id}")
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response partialUpdateTour(@PathParam("id") Long id, Tour tour)
			throws AppException {
		tour.setTour_id(id);
		tourService.updatePartiallyTour(tour);
		return Response
				.status(Response.Status.OK)
				// 200
				.entity("The tour you specified has been successfully updated")
				.build();
	}
	
	@DELETE
	@Path("{id}")
	@Produces({ MediaType.TEXT_HTML })
	public Response deleteTour(@PathParam("id") Long id)
			throws AppException {
		Tour tour= new Tour();
		tour.setTour_id(id);
		tourService.deleteTour(tour);
		return Response.status(Response.Status.NO_CONTENT)// 204
				.entity("Tour successfully removed from database").build();
	}
}
