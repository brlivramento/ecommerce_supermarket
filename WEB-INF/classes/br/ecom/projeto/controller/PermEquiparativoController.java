package br.ecom.projeto.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PermEquiparativoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession(); 
		
		try {
			
			if (session.getAttribute("usuario")!= null) {
				RequestDispatcher rd = request.getRequestDispatcher("ListaEquiparativoController");
				rd.forward(request, response);
			} 

			if (session.getAttribute("usuario") == null) {
				RequestDispatcher rd = request.getRequestDispatcher("login-bloq.jsp");
				rd.forward(request, response);
			
			} else {

				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}

	}
}