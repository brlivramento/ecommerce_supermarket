package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ecom.projeto.bo.CatalogoNegocio;
import br.ecom.projeto.bo.CategoriasNegocio;
import br.ecom.projeto.models.Categoria;
import br.ecom.projeto.models.Produto;
import br.ecom.projeto.models.SubCategoria;

public class BuscaCatalogoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		try {
			
			CategoriasNegocio bo = new CategoriasNegocio();
			CatalogoNegocio bo2 = new CatalogoNegocio();
			
			if(request.getParameter("listaCategoria") != null) {

				Categoria cat = new Categoria();
				cat.setCategoriaid(Integer.parseInt(request.getParameter("listaCategoria")));

				List<Produto> produtoscat = bo2.getListac(cat);				
				request.setAttribute("produtoscat", produtoscat);
			}

			if(request.getParameter("listaSubCategoria") != null) {

				SubCategoria sub = new SubCategoria();
				sub.setSubcatid(Integer.parseInt(request.getParameter("listaSubCategoria")));

				List<Produto> produtossub = bo2.getListas(sub);		
				request.setAttribute("produtossub",  produtossub);

			}

			List<Categoria> todascategorias = bo.getCategoria();
			request.setAttribute("todascategorias", todascategorias);

			List<SubCategoria> todassubcategorias = bo.getSubCategoria();				
			request.setAttribute("todassubcategorias", todassubcategorias);

			if (request.getParameter("buttonListaCompras")!= null){
				RequestDispatcher rd = request.getRequestDispatcher("lista-catalogo.jsp");
				rd.include(request, response);
			}

			if (request.getParameter("buttonCarrinho")!= null) {
				RequestDispatcher rd = request.getRequestDispatcher("pedido-catalogo.jsp");
				rd.include(request, response);
			}

			if (request.getParameter("buttonOferta")!= null) {	
				String ok = null;
				request.setAttribute("ok", ok);
            	RequestDispatcher rd = request.getRequestDispatcher("ofertas-controle.jsp");
				rd.include(request, response);
			}

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
