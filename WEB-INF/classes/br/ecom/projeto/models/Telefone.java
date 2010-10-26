package br.ecom.projeto.models;

import java.io.Serializable;

public class Telefone implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int telefoneid;
	private int telefonenumero;
	private int telefoneddd;
	private String telefonetipo;
	
	public Telefone(){}
	
	public Telefone(int telefoneid, int telefonenumero, int telefoneddd, String telefonetipo){
		this.telefoneid = telefoneid;
		this.telefonenumero = telefonenumero;
		this.telefoneddd = telefoneddd;
		this.telefonetipo = telefonetipo;
	}
	
	public int getTelefoneid() {
		return telefoneid;
	}
	public void setTelefoneid(int telefoneid) {
		this.telefoneid = telefoneid;
	}
	public int getTelefonenumero() {
		return telefonenumero;
	}
	public void setTelefonenumero(int telefonenumero) {
		this.telefonenumero = telefonenumero;
	}
	public int getTelefoneddd() {
		return telefoneddd;
	}
	public void setTelefoneddd(int telefoneddd) {
		this.telefoneddd = telefoneddd;
	}
	public void setTelefonetipo(String telefonetipo) {
		this.telefonetipo = telefonetipo;
	}
	public String getTelefonetipo() {
		return telefonetipo;
	}
	
	
	

}
