package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.models.ItemL;

public class FormularioController extends HttpServlet {
	   
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 		
		List<ItemL> itens = (List<ItemL>)session.getAttribute("itens");

		session.setAttribute("itens", itens);
		RequestDispatcher rd = request.getRequestDispatcher("lista-form.jsp");
		rd.include(request, response);
	}
}
