package com.gigfork.api.resource;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


import com.gigfork.api.resource.exceptions.B2BApiException;
import com.gigfork.api.resource.utils.Paths;
import com.gigfork.jaxb.rest.LoginResponse;



@Path(Paths.AUTHENTICATION)
@Produces(MediaType.APPLICATION_XML)
public interface IAuthenticationResource {

	/* (non-Javadoc)
	 * @see com.mybet.b2b.resources.general.IAuthenticationResource#login(java.lang.String, java.lang.String)
	 */
	@POST
    @Path(Paths.AUTHENTICATION_LOGIN)
	public LoginResponse login(@QueryParam("user-name") final String userName, @QueryParam("user-password") final String userPassword) throws B2BApiException;

	/* (non-Javadoc)
	 * @see com.mybet.b2b.resources.general.IAuthenticationResource#logout(java.lang.String)
	 */
	@POST
	@Path(Paths.AUTHENTICATION_LOGOUT)
	public Response logout(@QueryParam("token") final String token) throws B2BApiException;

}