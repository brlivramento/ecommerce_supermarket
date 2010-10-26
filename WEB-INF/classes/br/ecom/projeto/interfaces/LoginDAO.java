package br.ecom.projeto.interfaces;

import java.util.List;

import br.ecom.projeto.models.Login;

public interface LoginDAO {
	
	public boolean verficaLogin (Login usuario);
	public List<Login> obterNome(String usuario);
}
