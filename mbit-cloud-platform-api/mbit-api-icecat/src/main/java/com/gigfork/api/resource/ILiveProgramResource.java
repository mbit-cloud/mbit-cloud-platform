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
public interface ILiveProgramResource extends IMainProgramResource{

	/**
	 * The whole betting-program for live. It will be updated every minute.
	 * @param oddsType the formatting of odds
	 * @return the whole live-event program
	 * @throws B2BApiException 
	 */
	@GET
	@Path(Paths.LIVE)
	public BettingProgram getBettingProgram() throws B2BApiException;

	/**
	 * delivers all translations for the whole betting-program
	 * @return all translations for the whole betting-program in given language
	 * @throws B2BApiException 
	 */
	@GET
	@Path(Paths.LIVE_TRANSLATIONS)
	public BettingProgramTranslations getTranslations() throws B2BApiException;

	/**
	 * A snapshot of the current live-events. It contains data like current prices, red cards etc.
	 * Updated about every 5 seconds.
	 * @return an update of current live events
	 * @throws B2BApiException 
	 */
	@GET
	@Path(Paths.LIVE_VOLATILE)
	public BettingProgram getVolatile() throws B2BApiException;

}