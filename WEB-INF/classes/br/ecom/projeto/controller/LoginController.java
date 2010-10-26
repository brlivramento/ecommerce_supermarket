package br.ecom.projeto.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.bo.LoginNegocio;
import br.ecom.projeto.models.Login;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
			 
		try {

			Login usuario = new Login();
			usuario.setLogindescricao(request.getParameter("usuario.logindescricao"));
			usuario.setLoginsenha(request.getParameter("usuario.loginsenha"));
						
			if (usuario.getLogindescricao().length() == 0){
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
	    	}
	    	
			if (usuario.getLoginsenha().length() == 0){
	    		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
	    	}
			
			LoginNegocio bo = new LoginNegocio();
    		bo.verficaLogin(usuario);
    		if (new LoginNegocio().verficaLogin(usuario) == true){
    			HttpSession session = request.getSession();
    			session.setAttribute("usuario", usuario);
    			session.setAttribute("itens", null);
    			session.setAttribute("lista", null);
    			session.setAttribute("controle", null);
    			session.setAttribute("controle2", null);
    			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
    		} else if (usuario.getLogindescricao().equals("adm") && usuario.getLoginsenha().equals("adm")) {
    			HttpSession session = request.getSession();
    			String administrador = "administrador";
    			session.setAttribute("administrador", administrador); 
    			session.setAttribute("usuario", usuario);
    			session.setAttribute("itens", null);
    			session.setAttribute("lista", null);
    			session.setAttribute("controle", null);
    			session.setAttribute("controle2", null);
    			RequestDispatcher rd = request.getRequestDispatcher("ofertas-controle.jsp");
				rd.include(request, response);
			} else {
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
    		}
			
			
	    	

		} catch (Exception e) {
			throw new ServletException(e);
		}

	}
}
