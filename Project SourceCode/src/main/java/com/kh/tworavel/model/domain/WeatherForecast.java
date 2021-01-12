package com.kh.tworavel.model.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class WeatherForecast {
	
	private String date3;
	private String date4;
	private String date5;
	private String date6;
	private String date7;
	private String date8;
	private String date9;
	private String date10;
	private String taMax3;
	private String taMin3;
	private String taMax4;
	private String taMin4;
	private String taMax5;
	private String taMin5;
	private String taMax6;
	private String taMin6;
	private String taMax7;
	private String taMin7;
	private String taMax8;
	private String taMin8;
	private String taMax9;
	private String taMin9;
	private String taMax10;
	private String taMin10;
	
	private String wf3;
	private String wf4;
	private String wf5;
	private String wf6;
	private String wf7;
	private String wf8;
	private String wf9;
	private String wf10;



	public String getWf3() {
		return wf3;
	}

	public void setWf3(String wf3) {
		this.wf3 = wf3;
	}

	public String getWf4() {
		return wf4;
	}

	public void setWf4(String wf4) {
		this.wf4 = wf4;
	}

	public String getWf5() {
		return wf5;
	}

	public void setWf5(String wf5) {
		this.wf5 = wf5;
	}

	public String getWf6() {
		return wf6;
	}

	public void setWf6(String wf6) {
		this.wf6 = wf6;
	}

	public String getWf7() {
		return wf7;
	}

	public void setWf7(String wf7) {
		this.wf7 = wf7;
	}

	public String getWf8() {
		return wf8;
	}

	public void setWf8(String wf8) {
		this.wf8 = wf8;
	}

	public String getWf9() {
		return wf9;
	}

	public void setWf9(String wf9) {
		this.wf9 = wf9;
	}

	public String getWf10() {
		return wf10;
	}

	public void setWf10(String wf10) {
		this.wf10 = wf10;
	}

	public WeatherForecast(){
     	Calendar cal = Calendar.getInstance();
    	cal.setTime(new Date());
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    	DateFormat df3 = new SimpleDateFormat("HHmm");
    	String sysdate =df3.format(cal.getTime());

    	if((sysdate.substring(0,1).equals("0"))) {
    		if((sysdate.substring(1,2).equals("0"))||(559>=Integer.parseInt(sysdate.substring(1,4)))) {
    			System.out.println(sysdate);
    			cal.add(Calendar.DATE,-1);
    		}
    	}
    	
    	cal.add(Calendar.DATE,3);
    	date3=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date4=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date5=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date6=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date7=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date8=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date9=df.format(cal.getTime());
    	cal.add(Calendar.DATE,1);
    	date10=df.format(cal.getTime());

	}
	
	public String getDate3() {
		return date3;
	}
	public void setDate3(String date3) {
		this.date3 = date3;
	}
	public String getDate4() {
		return date4;
	}
	public void setDate4(String date4) {
		this.date4 = date4;
	}
	public String getDate5() {
		return date5;
	}
	public void setDate5(String date5) {
		this.date5 = date5;
	}
	public String getDate6() {
		return date6;
	}
	public void setDate6(String date6) {
		this.date6 = date6;
	}
	public String getDate7() {
		return date7;
	}
	public void setDate7(String date7) {
		this.date7 = date7;
	}
	public String getDate8() {
		return date8;
	}
	public void setDate8(String date8) {
		this.date8 = date8;
	}
	public String getDate9() {
		return date9;
	}
	public void setDate9(String date9) {
		this.date9 = date9;
	}
	public String getDate10() {
		return date10;
	}
	public void setDate10(String date10) {
		this.date10 = date10;
	}
	public String getTaMax3() {
		return taMax3;
	}
	public void setTaMax3(String taMax3) {
		this.taMax3 = taMax3;
	}
	public String getTaMin3() {
		return taMin3;
	}
	public void setTaMin3(String taMin3) {
		this.taMin3 = taMin3;
	}
	public String getTaMax4() {
		return taMax4;
	}
	public void setTaMax4(String taMax4) {
		this.taMax4 = taMax4;
	}
	public String getTaMin4() {
		return taMin4;
	}
	public void setTaMin4(String taMin4) {
		this.taMin4 = taMin4;
	}
	public String getTaMax5() {
		return taMax5;
	}
	public void setTaMax5(String taMax5) {
		this.taMax5 = taMax5;
	}
	public String getTaMin5() {
		return taMin5;
	}
	public void setTaMin5(String taMin5) {
		this.taMin5 = taMin5;
	}
	public String getTaMax6() {
		return taMax6;
	}
	public void setTaMax6(String taMax6) {
		this.taMax6 = taMax6;
	}
	public String getTaMin6() {
		return taMin6;
	}
	public void setTaMin6(String taMin6) {
		this.taMin6 = taMin6;
	}
	public String getTaMax7() {
		return taMax7;
	}
	public void setTaMax7(String taMax7) {
		this.taMax7 = taMax7;
	}
	public String getTaMin7() {
		return taMin7;
	}
	public void setTaMin7(String taMin7) {
		this.taMin7 = taMin7;
	}
	public String getTaMax8() {
		return taMax8;
	}
	public void setTaMax8(String taMax8) {
		this.taMax8 = taMax8;
	}
	public String getTaMin8() {
		return taMin8;
	}
	public void setTaMin8(String taMin8) {
		this.taMin8 = taMin8;
	}
	public String getTaMax9() {
		return taMax9;
	}
	public void setTaMax9(String taMax9) {
		this.taMax9 = taMax9;
	}
	public String getTaMin9() {
		return taMin9;
	}
	public void setTaMin9(String taMin9) {
		this.taMin9 = taMin9;
	}
	public String getTaMax10() {
		return taMax10;
	}
	public void setTaMax10(String taMax10) {
		this.taMax10 = taMax10;
	}
	public String getTaMin10() {
		return taMin10;
	}
	public void setTaMin10(String taMin10) {
		this.taMin10 = taMin10;
	}
	
	
	
	
}
