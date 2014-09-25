package com.gigfork.api.resource.utils;

public final class Paths {
	
	public static final String BETTING_PROGRAM_AND_VERSION = "/betting-program/";
    public static final String MAIN = "/main";
    public static final String MAIN_TRANSLATIONS = MAIN + "/translations";
    public static final String MAIN_VOLATILE = MAIN + "/volatile";
    public static final String LIVE = "/live";
    public static final String LIVE_TRANSLATIONS = LIVE + "/translations";
    public static final String LIVE_VOLATILE = LIVE + "/volatile";

    public static final String ERROR = "/error/";
    public static final String ERROR_DETAILS = "/details";
    public static final String ERROR_DETAIL_CODE = "/detail/{error-code}";

    public final static String AUTHENTICATION = "/authentication/";
    public final static String AUTHENTICATION_LOGIN = "/login";
    public final static String AUTHENTICATION_LOGOUT = "/logout";

    public static final String USER_ACTIONS = "/user-actions/";
    public static final String USER_ACTIONS_PLACE_BET = "/place-bet";
    public static final String USER_ACTIONS_PLACED_BET_STATUS = "/place-bet/{systemId}";
    
    
    public static final String SWINES_WORDPRESS_RESOURCE = "/swines";
    public static final String STREAM_BASE_RESOURCE = "/stream";
    public static final String STREAM_PUBLISHER_RESOURCE = "/publish";
    public static final String STREAM_CONSUMER_RESOURCE = "/consume";
    public static final String STREAM_SNAPSHOT_RESOURCE = "/snapshot";
    public static final String STREAM_INFO_RESOURCE = "/info";

    
    public static final String SWINES_BAMBUSER_RESOURCE = "/bambuser";
    
    public static final String SWAGGER_DOCUMENTATION_RESOURCE = "/doc";
    public static final String LIBRARY_RESOURCE = "library";
    
    
    
    
    
    
}
