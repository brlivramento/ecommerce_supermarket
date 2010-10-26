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

public class BuscaProdutosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		try {

			String s = request.getParameter("txtBUSCA");
			String m = request.getParameter("txtBUSCA2");

			if (request.getParameter("buttonListaCompras")!= null){

				if(request.getParameter("txtBUSCA") != null) {
					if (s.length() != 0) {

						CatalogoNegocio bo = new CatalogoNegocio();					
						List<Produto> produtosbusca = bo.getListad(s);
						request.setAttribute("produtosbusca", produtosbusca);

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);

					} else if (s.length() == 0) {					

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);
					}
				} else {

					if(m.length() != 0) {

						CatalogoNegocio bo = new CatalogoNegocio();
						List<Produto> produtosmarca = bo.getListad(s);
						request.setAttribute("produtosmarca", produtosmarca);

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);

					} else if (m.length() == 0){

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);

					}
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("lista-catalogo.jsp");
				rd.include(request, response);
			}






			if (request.getParameter("buttonCarrinho")!= null) {

				if(request.getParameter("txtBUSCA") != null) {
					if (s.length() != 0) {

						CatalogoNegocio bo = new CatalogoNegocio();					
						List<Produto> produtosbusca = bo.getListad(s);
						request.setAttribute("produtosbusca", produtosbusca);

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);


					} else if (s.length() == 0){

						String semresultado = "semresultado";
						request.setAttribute("semresultado", semresultado);

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);

					} 

				} else {

					if(m.length() != 0) {

						CatalogoNegocio bo = new CatalogoNegocio();
						List<Produto> produtosmarca = bo.getListad(s);
						request.setAttribute("produtosmarca", produtosmarca);

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);


					} else if(m.length() == 0) {

						String semresultado = "semresultado";
						request.setAttribute("semresultado", semresultado);

						CategoriasNegocio bo2 = new CategoriasNegocio();
						List<Categoria> todascategorias = bo2.getCategoria();
						List<SubCategoria> todassubcategorias = bo2.getSubCategoria();			

						request.setAttribute("todascategorias", todascategorias);			
						request.setAttribute("todassubcategorias", todassubcategorias);

					}
				}

				RequestDispatcher rd = request.getRequestDispatcher("pedido-catalogo.jsp");
				rd.include(request, response);			

			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}