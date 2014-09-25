package com.gigfork.api.resource;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


import com.gigfork.api.resource.exceptions.B2BApiException;
import com.gigfork.api.resource.utils.Paths;
import com.gigfork.jaxb.rest.BettingProgram;
import com.gigfork.jaxb.rest.BettingProgramTranslations;



@Path(Paths.BETTING_PROGRAM_AND_VERSION)
@Produces(MediaType.APPLICATION_XML)
public interface IMainProgramResource {

	/**
	 * The whole betting-program for live. It will be updated every minute.
	 * @param oddsType the formatting of odds
	 * @return the whole live-event program
	 * @throws B2BApiException 
	 */
	@GET
	@Path(Paths.MAIN)
	public BettingProgram getBettingProgram() throws B2BApiException;

	/**
	 * delivers all translations for the whole betting-program
	 * @return all translations for the whole betting-program in given language
	 * @throws B2BApiException 
	 */
	@GET
	@Path(Paths.MAIN_TRANSLATIONS)
	public BettingProgramTranslations getTranslations() throws B2BApiException;

	/**
	 * The latest data for betting-program (future-events and live). Updated every 10minutes.
	 * @return an update of the betting-program
	 * @throws B2BApiException 
	 */
	@GET
	@Path(Paths.MAIN_VOLATILE)
	public BettingProgram getVolatile() throws B2BApiException;

}