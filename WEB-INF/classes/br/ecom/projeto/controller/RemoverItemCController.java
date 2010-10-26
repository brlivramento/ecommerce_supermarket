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

public class RemoverItemCController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		HttpSession session = request.getSession(); 

		int id = Integer.parseInt(request.getParameter(("id")));

		if(request.getParameter("id") != null) {
			List<ItemL> itens = (List<ItemL>)session.getAttribute("itens");
			itens.remove(id);
			session.setAttribute("itens", itens);
		}
		
		int controle = (Integer)session.getAttribute("controle");
		controle = (controle - 1);
		session.setAttribute("controle", controle);
		
		if(controle == 0){
			session.setAttribute("controle", null);
			session.setAttribute("itens", null);
		}
	
		RequestDispatcher rd = request.getRequestDispatcher("minha-lista.jsp");
		rd.forward(request, response);

	}
}