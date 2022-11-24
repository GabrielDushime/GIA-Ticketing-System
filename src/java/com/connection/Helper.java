package com.connection;

import java.util.HashMap;

public class Helper {
	public static String baseUrl = "http://localhost:8080/GIA_Group_Ticket_System/";
	public static String TestName="T ruon";
	public static String Currency = "TK";
	public static HashMap<String,String> TrainsCoach(){
		HashMap<String,String> coach = new HashMap<String,String>();
		coach.put("RITCO", "RITCO");
		coach.put("VOLCANO", "VOLCANO");
		coach.put("HORIZON", "HORIZON");
		coach.put("ALPHA", "ALPHA");
		return coach;
	}
}
