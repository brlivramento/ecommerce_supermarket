package br.ecom.projeto.controller;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.bo.OfertaNegocio;
import br.ecom.projeto.models.Ofertas;
import br.ecom.projeto.models.Produto;

public class CadastraOfertaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		try {

			HttpSession session = request.getSession();
			Produto produto = (Produto) session.getAttribute("produto");

			DecimalFormat form = new DecimalFormat("#.00"); 
			String s = form.format(session.getAttribute("resultado"));
			s = s.replace(',', '.'); 

			OfertaNegocio bo = new OfertaNegocio();
			Ofertas oferta = new Ofertas();
			oferta.setDesconto(s);
			oferta.setProduto(produto);		
			bo.setOferta(oferta);
			
			RequestDispatcher rd = request.getRequestDispatcher("BuscaOfertasController");
			rd.include(request, response);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}

	}
}