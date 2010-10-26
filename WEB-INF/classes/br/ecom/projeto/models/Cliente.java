package br.ecom.projeto.models;

public class Cliente {
	
	private static final long serialVersionUID = 1L;
	
	private int clienteid;
	private String clientenome;
	private String clientesexo;
	private long clienterg;
	private long clientecpf;
	private String clientedatanasc;
	private Telefone telefone;
	private Email email;
	private Endereco end;

	public Cliente(){}

	public Cliente(int clienteid, String clientenome, String clientesexo, long clienterg, long clientecpf, String clientedatanasc, Telefone telefone, Email email, Endereco end) {
		this.clienteid = clienteid;
		this.clientenome = clientenome;
		this.clientesexo = clientesexo;
		this.clienterg = clienterg;
		this.clientecpf = clientecpf;
		this.clientedatanasc = clientedatanasc;
		this.telefone = telefone;
		this.email = email;
		this.end = end;
	}
	
	public int getClienteid() {
		return clienteid;
	}
	public void setClienteid(int clienteid) {
		this.clienteid = clienteid;
	}
	public String getClientenome() {
		return clientenome;
	}
	public void setClientenome(String clientenome) {
		this.clientenome = clientenome;
	}
	public String getClientesexo() {
		return clientesexo;
	}
	public void setClientesexo(String clientesexo) {
		this.clientesexo = clientesexo;
	}
	public long getClienterg() {
		return clienterg;
	}
	public void setClienterg(long clienterg) {
		this.clienterg = clienterg;
	}
	public long getClientecpf() {
		return clientecpf;
	}
	public void setClientecpf(long clientecpf) {
		this.clientecpf = clientecpf;
	}
	
	public Telefone getTelefone() {
		return telefone;
	}
	public void setTelefone(Telefone telefone) {
		this.telefone = telefone;
	}
	public Email getEmail() {
		return email;
	}
	public void setEmail(Email email) {
		this.email = email;
	}
	public Endereco getEnd() {
		return end;
	}
	public void setEnd(Endereco end) {
		this.end = end;
	}
	public void setClientedatanasc(String clientedatanasc) {
		this.clientedatanasc = clientedatanasc;
	}
	public String getClientedatanasc() {
		return clientedatanasc;
	}

}
