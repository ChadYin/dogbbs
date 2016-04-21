package com.db.model;

import java.sql.Timestamp;


public class Topic {

	private int t_id;
	private String t_name;
	private String t_content;
	private int t_u_id;
	private int t_s_id;
	private Timestamp t_time;
	private String u_name;
	
	
	
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public int getT_u_id() {
		return t_u_id;
	}
	public void setT_u_id(int t_u_id) {
		this.t_u_id = t_u_id;
	}
	public int getT_s_id() {
		return t_s_id;
	}
	public void setT_s_id(int t_s_id) {
		this.t_s_id = t_s_id;
	}
	public Timestamp getT_time() {
		return t_time;
	}
	public void setT_time(Timestamp t_time) {
		this.t_time = t_time;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
}
