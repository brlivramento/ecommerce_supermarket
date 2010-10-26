package br.ecom.projeto.actions;

import com.opensymphony.xwork2.ActionSupport;

import br.ecom.projeto.bo.CadastroNegocio;
import br.ecom.projeto.models.Cliente;
import br.ecom.projeto.models.Email;
import br.ecom.projeto.models.Endereco;
import br.ecom.projeto.models.Login;
import br.ecom.projeto.models.Telefone;

public class CadastroAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	public Telefone telefone;
	public Email email;
	public Endereco endereco;
	public Cliente cliente;
	public Login login;
	

	public String execute() {
		CadastroNegocio bo = new CadastroNegocio();
		bo.setCadastro(telefone, email, endereco, cliente, login);
		return SUCCESS;
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

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

}
