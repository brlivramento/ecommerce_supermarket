package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.models.ItemC;

public class RemoverListaCarrinhoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession(); 		

		List<ItemC> lista = (List<ItemC>)session.getAttribute("lista");
		lista = null;
		session.setAttribute("lista", lista);
		@SuppressWarnings("unused")
		int controle2 = (Integer)session.getAttribute("controle2");
		controle2 = 0;
		session.setAttribute("controle2", null);		
		RequestDispatcher rd = request.getRequestDispatcher("meu-carrinho.jsp");
		rd.include(request, response);
	}

}
