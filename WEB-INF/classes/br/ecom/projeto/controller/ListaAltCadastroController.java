package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.bo.CadastroNegocio;
import br.ecom.projeto.models.Cliente;
import br.ecom.projeto.models.Login;

public class ListaAltCadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		CadastroNegocio bo = new CadastroNegocio();
		HttpSession session = request.getSession();
		Login usuario = (Login) session.getAttribute("usuario");
				
		if (usuario != null) {
			
			List<Cliente> lista = bo.obterId(usuario);
			request.setAttribute("lista", lista);
			RequestDispatcher rd = request.getRequestDispatcher("cadastro-alterar.jsp");
			rd.include(request, response);
		}
		
	}		
}