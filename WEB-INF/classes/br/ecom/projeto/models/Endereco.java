package br.ecom.projeto.models;

import java.io.Serializable;

public class Endereco implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int endid;
	private String endlogradouro;
	private int endnumero;
	private String endcomplemento;
	private String endbairro;
	private String endcidade;
	private String endestado;
	private int endcep;
	private String endtipo;
	
	public Endereco(){}
	
	public Endereco(int endid, String endlogradouro, int endnumero, String endcomplemento, String endbairro, String endcidade, String endestado, int endcep, String endtipo){
		this.endid = endid;
		this.endlogradouro = endlogradouro;
		this.endnumero = endnumero;
		this.endcomplemento = endcomplemento;
		this.endbairro = endbairro;
		this.endcidade = endcidade;
		this.endestado = endestado;
		this.endcep = endcep;
		this.endtipo = endtipo;
	}
	
	public int getEndid() {
		return endid;
	}
	public void setEndid(int endid) {
		this.endid = endid;
	}
	public String getEndlogradouro() {
		return endlogradouro;
	}
	public void setEndlogradouro(String endlogradouro) {
		this.endlogradouro = endlogradouro;
	}
	public int getEndnumero() {
		return endnumero;
	}
	public void setEndnumero(int endnumero) {
		this.endnumero = endnumero;
	}
	public String getEndcomplemento() {
		return endcomplemento;
	}
	public void setEndcomplemento(String endcomplemento) {
		this.endcomplemento = endcomplemento;
	}
	public String getEndbairro() {
		return endbairro;
	}
	public void setEndbairro(String endbairro) {
		this.endbairro = endbairro;
	}
	public String getEndcidade() {
		return endcidade;
	}
	public void setEndcidade(String endcidade) {
		this.endcidade = endcidade;
	}
	public String getEndestado() {
		return endestado;
	}
	public void setEndestado(String endestado) {
		this.endestado = endestado;
	}
	public int getEndcep() {
		return endcep;
	}
	public void setEndcep(int endcep) {
		this.endcep = endcep;
	}
	public void setEndtipo(String endtipo) {
		this.endtipo = endtipo;
	}
	public String getEndtipo() {
		return endtipo;
	}
	
	
	
	

}
