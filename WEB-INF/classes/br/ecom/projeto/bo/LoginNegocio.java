package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLLoginDAO;
import br.ecom.projeto.interfaces.LoginDAO;
import br.ecom.projeto.models.Login;

public class LoginNegocio {
	
	public boolean verficaLogin(Login usuario) {
		LoginDAO dao = new MySQLLoginDAO();
		return dao.verficaLogin(usuario);
	}
	
	public List<Login> obterNome(String usuario){
		LoginDAO dao = new MySQLLoginDAO();
		return dao.obterNome(usuario);
	}

}
