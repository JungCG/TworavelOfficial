package com.kh.tworavel.model.domain;

//C_ID NUMBER NOT NULL PRIMARY KEY,
//C_NAME VARCHAR2(500) NOT NULL,
//C_LA NUMBER DEFAULT 0 NOT NULL,
//C_MA NUMBER DEFAULT 0 NOT NULL,
//
//C_defCnt NUMBER DEFAULT 0 NOT NULL,
//C_isolIngCnt NUMBER DEFAULT 0 NOT NULL,
//C_isolClearCnt NUMBER DEFAULT 0 NOT NULL,
//C_incDec NUMBER DEFAULT 0 NOT NULL,
//C_deathcnt NUMBER DEFAULT 0 NOT NULL,
//C_qurRate NUMBER DEFAULT 0 NOT NULL,
//C_createDt TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
public class CoronaMap {
	private int c_id;
	private String c_name;
	private double c_la;
	private double c_ma;
	private int c_defcnt;
	private int c_isolingcnt;
	private int c_isolclearcnt;
	private int c_incdec;
	private int c_deathcnt;
	private double c_qurrate;
	private String c_createdt;
	
	public CoronaMap() {}

	public CoronaMap(int c_id, String c_name, double c_la, double c_ma, int c_defcnt, int c_isolingcnt,
			int c_isolclearcnt, int c_incdec, int c_deathcnt, double c_qurrate, String c_createdt) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_la = c_la;
		this.c_ma = c_ma;
		this.c_defcnt = c_defcnt;
		this.c_isolingcnt = c_isolingcnt;
		this.c_isolclearcnt = c_isolclearcnt;
		this.c_incdec = c_incdec;
		this.c_deathcnt = c_deathcnt;
		this.c_qurrate = c_qurrate;
		this.c_createdt = c_createdt;
	}

	public CoronaMap(int c_id, int c_defcnt, int c_isolingcnt, int c_isolclearcnt, int c_incdec, int c_deathcnt,
			double c_qurrate) {
		super();
		this.c_id = c_id;
		this.c_defcnt = c_defcnt;
		this.c_isolingcnt = c_isolingcnt;
		this.c_isolclearcnt = c_isolclearcnt;
		this.c_incdec = c_incdec;
		this.c_deathcnt = c_deathcnt;
		this.c_qurrate = c_qurrate;
	}

	public CoronaMap(int c_defcnt, int c_isolingcnt, int c_isolclearcnt, int c_incdec, int c_deathcnt, double c_qurrate) {
		super();
		this.c_defcnt = c_defcnt;
		this.c_isolingcnt = c_isolingcnt;
		this.c_isolclearcnt = c_isolclearcnt;
		this.c_incdec = c_incdec;
		this.c_deathcnt = c_deathcnt;
		this.c_qurrate = c_qurrate;
	}
	
	public CoronaMap(String c_name, int c_defcnt, int c_isolingcnt, int c_isolclearcnt, int c_incdec, int c_deathcnt,
			double c_qurrate, String c_createdt) {
		super();
		this.c_name = c_name;
		this.c_defcnt = c_defcnt;
		this.c_isolingcnt = c_isolingcnt;
		this.c_isolclearcnt = c_isolclearcnt;
		this.c_incdec = c_incdec;
		this.c_deathcnt = c_deathcnt;
		this.c_qurrate = c_qurrate;
		this.c_createdt = c_createdt;
	}

	@Override
	public String toString() {
		return "CoronaMap [c_id=" + c_id + ", c_name=" + c_name + ", c_la=" + c_la + ", c_ma=" + c_ma + ", c_defcnt="
				+ c_defcnt + ", c_isolingcnt=" + c_isolingcnt + ", c_isolclearcnt=" + c_isolclearcnt + ", c_incdec="
				+ c_incdec + ", c_deathcnt=" + c_deathcnt + ", c_qurrate=" + c_qurrate + ", c_createdt=" + c_createdt + "]";
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public double getC_la() {
		return c_la;
	}

	public void setC_la(double c_la) {
		this.c_la = c_la;
	}

	public double getC_ma() {
		return c_ma;
	}

	public void setC_ma(double c_ma) {
		this.c_ma = c_ma;
	}

	public int getC_defcnt() {
		return c_defcnt;
	}

	public void setC_defcnt(int c_defcnt) {
		this.c_defcnt = c_defcnt;
	}

	public int getC_isolingcnt() {
		return c_isolingcnt;
	}

	public void setC_isolingcnt(int c_isolingcnt) {
		this.c_isolingcnt = c_isolingcnt;
	}

	public int getC_isolclearcnt() {
		return c_isolclearcnt;
	}

	public void setC_isolclearcnt(int c_isolclearcnt) {
		this.c_isolclearcnt = c_isolclearcnt;
	}

	public int getC_incdec() {
		return c_incdec;
	}

	public void setC_incdec(int c_incdec) {
		this.c_incdec = c_incdec;
	}

	public int getc_deathcnt() {
		return c_deathcnt;
	}

	public void setc_deathcnt(int c_deathcnt) {
		this.c_deathcnt = c_deathcnt;
	}

	public double getc_qurrate() {
		return c_qurrate;
	}

	public void setc_qurrate(double c_qurrate) {
		this.c_qurrate = c_qurrate;
	}

	public String getC_createdt() {
		return c_createdt;
	}

	public void setC_createdt(String c_createdt) {
		this.c_createdt = c_createdt;
	}
}
