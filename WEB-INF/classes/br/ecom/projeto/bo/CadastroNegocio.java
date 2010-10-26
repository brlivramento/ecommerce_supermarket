package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLCadastroDAO;
import br.ecom.projeto.interfaces.CadastroDAO;
import br.ecom.projeto.models.Cliente;
import br.ecom.projeto.models.Email;
import br.ecom.projeto.models.Endereco;
import br.ecom.projeto.models.Login;
import br.ecom.projeto.models.Telefone;


public class CadastroNegocio {
	
	public void setCadastro (Telefone telefone, Email email, Endereco endereco, Cliente cliente, Login login){
		CadastroDAO dao = new MySQLCadastroDAO();
		dao.incluirCadastro(telefone, email, endereco, cliente, login);
	}

	public void alterEndereco(Endereco endereco){
		CadastroDAO dao = new MySQLCadastroDAO();
		dao.alterarEndereco(endereco);
	}
	public void alterEmail(Email email){
		CadastroDAO dao = new MySQLCadastroDAO();
		dao.alterarEmail(email);
	}
	public void alterTelefone(Telefone telefone){
		CadastroDAO dao = new MySQLCadastroDAO();
		dao.alterarTelefone(telefone);
	}	

	public List<Cliente> obterCliente (String login){
		CadastroDAO dao = new MySQLCadastroDAO();
		return dao.obterCliente(login);
	}
	public List<Endereco> obterEndereco (String login){
		CadastroDAO dao = new MySQLCadastroDAO();
		return dao.obterEndereco(login);
	}
	public List<Telefone> obterTelefone (String login){
		CadastroDAO dao = new MySQLCadastroDAO();
		return dao.obterTelefone(login);
	}
	public List<Email> obterEmail (String login){
		CadastroDAO dao = new MySQLCadastroDAO();
		return dao.obterEmail(login);
	}
	
	public List<Cliente> obterId (Login login){
		CadastroDAO dao = new MySQLCadastroDAO();
		return dao.obterId(login);
	}

}
