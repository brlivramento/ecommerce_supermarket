package br.ecom.projeto.models;

import java.io.Serializable;

public class Email implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int emailid;
	private String emaildescricao;
	
	public Email(){}
	
	public Email(int emailid, String emaildescricao){
		this.emailid = emailid;
		this.emaildescricao = emaildescricao;
	}
	
	public int getEmailid() {
		return emailid;
	}
	public void setEmailid(int emailid) {
		this.emailid = emailid;
	}
	public String getEmaildescricao() {
		return emaildescricao;
	}
	public void setEmaildescricao(String emaildescricao) {
		this.emaildescricao = emaildescricao;
	}
	
	

}
