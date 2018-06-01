package com.pqh.tool;

public class EmailSpringTool {
	
	public static String sibltEmail(String email){
		
		
		return email.split("@")[1].split("\\.")[0];
	}
}
