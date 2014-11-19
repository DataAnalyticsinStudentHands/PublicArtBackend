package dash.pojo;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dash.errorhandling.AppException;
import dash.service.ArtObjectService;

/**
 * 
 * Service Class that handles REST requests for Art Objects
 * 
 * @author plindner
 */
@Component
@Path("/artobjects")
public class ArtObjectResource {

	@Autowired
	private ArtObjectService artObjectService;
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response createArtObject(ArtObject artObject) throws AppException {
		Long createArtObjectId = artObjectService.createArtObject(artObject);
		return Response.status(Response.Status.CREATED)
				// 201
				.entity("A new art object has been created")
				.header("Location",
						"http://..../artobjects/"
								+ String.valueOf(createArtObjectId)).build();
	}
	
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<ArtObject> getArtObjects(
			@QueryParam("orderByTitle") String orderByTitle)
					throws IOException,	AppException {
		List<ArtObject> artObjects = artObjectService.getArtObjects(
				orderByTitle);
		return artObjects;
	}

	@GET
	@Path("{id}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getArtObjectById(@PathParam("id") Long id,
			@QueryParam("detailed") boolean detailed)
					throws IOException,	AppException {
		ArtObject artObjectById = artObjectService.getArtObjectById(id);
		return Response
				.status(200)
				.entity(new GenericEntity<ArtObject>(artObjectById) {
				})
						.header("Access-Control-Allow-Headers", "X-extra-header")
						.allow("OPTIONS").build();
	}
	
	@PUT
	@Path("{id}")
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response putArtObjectById(@PathParam("id") Long id, ArtObject artObject)
			throws AppException {

		ArtObject artObjectById = artObjectService.verifyArtObjectExistenceById(id);

		if (artObjectById == null) {
			// resource not existent yet, and should be created under the
			// specified URI
			Long createArtObjectId = artObjectService.createArtObject(artObject);
			return Response
					.status(Response.Status.CREATED)
					// 201
					.entity("A new art object has been created AT THE LOCATION you specified")
					.header("Location",
							"http://.../artobjects/"
									+ String.valueOf(createArtObjectId)).build();
		} else {
			// resource is existent and a full update should occur
			artObjectService.updateFullyArtObject(artObject);
			return Response
					.status(Response.Status.OK)
					// 200
					.entity("The art object you specified has been fully updated")
					.header("Location",
							"http://.../artobjects/"
									+ String.valueOf(id)).build();
		}
	}

	// PARTIAL update
	@POST
	@Path("{id}")
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response partialUpdateArtObject(@PathParam("id") Long id, ArtObject artObject)
			throws AppException {
		artObject.setArtwork_id(id);
		artObjectService.updatePartiallyArtObject(artObject);
		return Response
				.status(Response.Status.OK)
				// 200
				.entity("The art object you specified has been successfully updated")
				.build();
	}

	/*
	 * *********************************** DELETE ***********************************
	 */
	@DELETE
	@Path("{id}")
	@Produces({ MediaType.TEXT_HTML })
	public Response deleteArtObject(@PathParam("id") Long id)
			throws AppException {
		ArtObject artObject= new ArtObject();
		artObject.setArtwork_id(id);
		artObjectService.deleteArtObject(artObject);
		return Response.status(Response.Status.NO_CONTENT)// 204
				.entity("ArtObject successfully removed from database").build();
	}

	@DELETE
	@Path("admin")
	@Produces({ MediaType.TEXT_HTML })
	public Response deleteArtObjects() {
		artObjectService.deleteArtObjects();
		return Response.status(Response.Status.NO_CONTENT)// 204
				.entity("All art objects have been removed").build();
	}
	
}