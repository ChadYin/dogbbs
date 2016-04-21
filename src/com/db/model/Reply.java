package com.db.model;

import java.sql.Timestamp;

public class Reply {
	private int r_id;
	private String r_content;
	private Timestamp r_time;
	private int r_u_id;
	private int r_t_id;
	private String u_name;
	private int u_id;

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Timestamp getR_time() {
		return r_time;
	}

	public void setR_time(Timestamp r_time) {
		this.r_time = r_time;
	}

	public int getR_u_id() {
		return r_u_id;
	}

	public void setR_u_id(int r_u_id) {
		this.r_u_id = r_u_id;
	}

	public int getR_t_id() {
		return r_t_id;
	}

	public void setR_t_id(int r_t_id) {
		this.r_t_id = r_t_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

}
