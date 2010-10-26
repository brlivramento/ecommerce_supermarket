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

public class DeleteItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession(); 		

		int id = Integer.parseInt(request.getParameter(("id")));

		if(request.getParameter("id") != null) {
			List<ItemC> lista = (List<ItemC>) session.getAttribute("lista");
			lista.remove(id);
			session.setAttribute("lista", lista);
		}

		int controle2 = (Integer)session.getAttribute("controle2");
		controle2 = (controle2 - 1);
		session.setAttribute("controle2", controle2);

		if(controle2 == 0){
			session.setAttribute("controle", null);
			session.setAttribute("lista", null);
		}

		RequestDispatcher rd = request.getRequestDispatcher("meu-carrinho.jsp");
		rd.forward(request, response);


	}
}
