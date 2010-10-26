package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ecom.projeto.bo.CategoriasNegocio;
import br.ecom.projeto.models.Categoria;
import br.ecom.projeto.models.SubCategoria;

public class CatalogoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		try {

			CategoriasNegocio bo = new CategoriasNegocio();
			
			List<Categoria> todascategorias = bo.getCategoria();
			request.setAttribute("todascategorias", todascategorias);
			
			List<SubCategoria> todassubcategorias = bo.getSubCategoria();			
			request.setAttribute("todassubcategorias", todassubcategorias);
			
			if (request.getParameter("buttonListaCompras")!= null){				
				RequestDispatcher rd = request.getRequestDispatcher("lista-catalogo.jsp");
				rd.forward(request, response);
			}
			
			if (request.getParameter("buttonCarrinho")!= null) {				
				RequestDispatcher rd = request.getRequestDispatcher("pedido-catalogo.jsp");
				rd.forward(request, response);
			}
						
            if (request.getParameter("buttonOferta")!= null) {				
				boolean ok = true;
            	request.setAttribute("ok", ok);
            	RequestDispatcher rd = request.getRequestDispatcher("ofertas-controle.jsp");
				rd.forward(request, response);
			}
			
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
