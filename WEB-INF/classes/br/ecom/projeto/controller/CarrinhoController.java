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

public class CarrinhoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		List<ItemC> lista = (List<ItemC>)session.getAttribute("lista");
		
		if(request.getParameter("txtCOMENT")!= null) {
			String comentarios = request.getParameter("txtCOMENT");		
			session.setAttribute("comentarios", comentarios);
		}
		
		session.setAttribute("lista", lista);
		
		RequestDispatcher rd = request.getRequestDispatcher("PersistenciaController");
		rd.forward(request, response);

	}
}