public class OpenCageWrapper{
	public cls_results[] results;
	public cls_status status;
	public class cls_results {
		public cls_annotations annotations;
		public cls_geometry geometry;
	}
	public class cls_annotations {
		public Integer callingcode;	//49
		public String wikidata;	//Q882721
	}
	public class cls_currency {
		public cls_alternate_symbols[] alternate_symbols;
		public String decimal_mark;	//,
		public String html_entity;	//€
		public String iso_code;	//EUR
		public String iso_numeric;	//978
		public String name;	//Euro
		public Integer smallest_denomination;	//1
		public String subunit;	//Cent
		public Integer subunit_to_unit;	//100
		public String symbol;	//€
		public Integer symbol_first;	//0
		public String thousands_separator;	//.
	}
	public class cls_alternate_symbols {
	}
	public class cls_geometry {
		public Double lat;	//50.9775106
		public Double lng;	//11.3285424
	}
	public class cls_status {
		public Integer code;	//200
		public String message;	//OK
	}
    /*
	public static OpenCageWrapper parse(String json){
		return (OpenCageWrapper) System.JSON.deserialize(json, OpenCageWrapper.class);
	}
    */

}