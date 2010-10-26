package br.ecom.projeto.models;

import java.io.Serializable;

public class Login implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int loginid;
	private String logindescricao;
	private String loginsenha;
	private Cliente cliente;
	
	public Login(){}
	
	public Login(int loginid, String logindescricao, String loginsenha, Cliente cliente){
		this.loginid = loginid;
		this.logindescricao = logindescricao;
		this.loginsenha = loginsenha;
		this.cliente = cliente;
	}
	
	
	public int getLoginid() {
		return loginid;
	}
	public void setLoginid(int loginid) {
		this.loginid = loginid;
	}
	public String getLoginsenha() {
		return loginsenha;
	}
	public void setLoginsenha(String loginsenha) {
		this.loginsenha = loginsenha;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public void setLogindescricao(String logindescricao) {
		this.logindescricao = logindescricao;
	}
	public String getLogindescricao() {
		return logindescricao;
	}
}
	
