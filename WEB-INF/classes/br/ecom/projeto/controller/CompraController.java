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
import br.ecom.projeto.models.ItemL;

public class CompraController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unchecked")
		protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

			HttpSession session = request.getSession(); 		
		
			List<ItemC> lista = (List<ItemC>) session.getAttribute("lista");
			List<ItemL> itens = (List<ItemL>)session.getAttribute("itens");
			lista = null;
			itens = null;
			session.setAttribute("lista", lista);
			session.setAttribute("itens", itens);
			session.setAttribute("controle", null);		
			session.setAttribute("controle2", null);
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}

	}