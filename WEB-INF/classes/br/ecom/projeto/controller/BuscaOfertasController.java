package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.imptdao.MySQLOfertasDAO;
import br.ecom.projeto.models.Ofertas;


public class BuscaOfertasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	

		MySQLOfertasDAO dao = new MySQLOfertasDAO();
		List<Ofertas> ofertas = dao.getOfertas();	
		HttpSession session = request.getSession(); 
		request.setAttribute("ofertas", ofertas); 

		if(session.getAttribute("administrador")!= null) {
			RequestDispatcher rd = request.getRequestDispatcher("ofertas-adm.jsp");
			rd.include(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("ofertas.jsp");
			rd.include(request, response);
		}
	}
}
