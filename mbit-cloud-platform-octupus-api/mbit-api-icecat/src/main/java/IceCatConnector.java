
public class IceCatConnector {
	
	private String connectorUrl = "http://data.icecat.biz/export/freexml.int/%s/";
	
	enum MBIT_LANGUAGES {
		PT,
		EN,
		ES,
		DE
		;
		
		public String toIceCatLanguge(MBIT_LANGUAGES l){
			return this.name();
		}
	}
	
	public String buildConnectorFor(MBIT_LANGUAGES t){
		return String.format(connectorUrl, t);
	}

}
