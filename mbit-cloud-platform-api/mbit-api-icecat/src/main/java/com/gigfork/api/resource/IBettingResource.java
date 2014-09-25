package com.gigfork.api.resource;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;


import com.gigfork.api.resource.exceptions.B2BApiException;
import com.gigfork.api.resource.utils.Paths;
import com.gigfork.jaxb.rest.PlaceBetRequest;
import com.gigfork.jaxb.rest.PlaceBetResponse;



@Path(Paths.USER_ACTIONS)
@Produces(MediaType.APPLICATION_XML)
public interface IBettingResource {

	@POST
	@Path(Paths.USER_ACTIONS_PLACE_BET)
	@Consumes(MediaType.APPLICATION_XML)
	public PlaceBetResponse processBetPlacement(
			PlaceBetRequest betPlacementRequest,
			@QueryParam("token") String token) throws B2BApiException;

	@GET
	@Path(Paths.USER_ACTIONS_PLACED_BET_STATUS)
	public PlaceBetResponse getBetStatusBySystemId(
			@QueryParam("token") String token,
			@PathParam("systemId") long systemId) throws B2BApiException;

}