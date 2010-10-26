package br.ecom.projeto.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class OfertaCalculoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
			
			if(request.getParameter("txtDESCONTO") != null){
							
				double valor = Double.parseDouble(request.getParameter("txtVALOR"));
				float desconto =  Float.parseFloat(request.getParameter("txtDESCONTO"));
				float p = (float) ((valor * desconto ) / 100) ; 
				float resultado = (float) (valor - p);
				
				session.setAttribute("resultado", resultado);
				session.setAttribute("desconto", desconto); 
				
				RequestDispatcher rd = request.getRequestDispatcher("ofertas-produto.jsp");
				rd.include(request, response);
			}

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}


