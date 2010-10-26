package br.ecom.projeto.interfaces;

import java.util.List;

import br.ecom.projeto.models.Login;
import br.ecom.projeto.models.Cliente;
import br.ecom.projeto.models.Email;
import br.ecom.projeto.models.Endereco;
import br.ecom.projeto.models.Telefone;

public interface CadastroDAO {

	public void incluirCadastro (Telefone telefone, Email email, Endereco endereco, Cliente cliente, Login login);	
	public void alterarEndereco(Endereco endereco);
	public void alterarEmail(Email email);
	public void alterarTelefone(Telefone telefone);
	public List<Cliente> obterId (Login login);
	public List<Cliente> obterCliente (String login);
	public List<Endereco> obterEndereco (String login);
	public List<Telefone> obterTelefone (String login);
	public List<Email> obterEmail (String login);
	
}
