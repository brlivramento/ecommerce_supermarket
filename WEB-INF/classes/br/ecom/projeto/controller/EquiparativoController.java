package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ecom.projeto.bo.EquiparativoNegocio;
import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.Produto;

public class EquiparativoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		try {
			String ok = "ok";

			EquiparativoNegocio bo = new EquiparativoNegocio();
			
			int p1 = Integer.parseInt(request.getParameter("primeiraLista"));
			int p2 = Integer.parseInt(request.getParameter("segundaLista"));	
			
			List<CarrinhoCompras> lista = bo.obterTotal(p1);
			double v1 = 0;
			for (CarrinhoCompras p : lista) {
				v1 = p.getPedidototal();
			}
			request.setAttribute("v1", v1);

			List<CarrinhoCompras> lista2 = bo.obterTotal(p2);
			double v2 =0;
			for (CarrinhoCompras p : lista2) {
				v2 = p.getPedidototal();
			}			
			request.setAttribute("v2", v2);

			double total = (v1 + v2);
			request.setAttribute("total", total);

			double economia = (v1 - v2);
			request.setAttribute("economia", economia);

			List<Produto> lista3 = bo.obterPrecoMaisBarato(p1);
			double maisb1 = 0;
			String imaisb1 = null;
			for(Produto p : lista3) {
				imaisb1 = p.getProdutotitulo();
				maisb1 = p.getProdutovalor();				
			}

			List<Produto> lista4 = bo.obterPrecoMaisBarato(p2);
			double maisb2 = 0;
			String imaisb2 = null;
			for(Produto p : lista4) {
				imaisb2 = p.getProdutotitulo();
				maisb2 = p.getProdutovalor();
			}
			if(maisb1 >= maisb2) {
				double maisbarato = maisb1;
				String imaisb = imaisb1;
				request.setAttribute("imaisb", imaisb);
				request.setAttribute("maisbarato", maisbarato);	
			} 
			if(maisb2 > maisb1){
				double maisbarato = maisb2;
				String imaisb = imaisb2;
				request.setAttribute("imaisb", imaisb);
				request.setAttribute("maisbarato", maisbarato);	
			}
			
			List<Produto> lista5 = bo.obterPrecoMaisCaro(p1);
			double maiscaro1 = 0;
			String imaiscaro1 = null;
			for(Produto p : lista5) {
				imaiscaro1 = p.getProdutotitulo();
				maiscaro1 = p.getProdutovalor();											
			}

			List<Produto> lista6 = bo.obterPrecoMaisCaro(p2);
			double maiscaro2 = 0;
			String imaiscaro2 = null;
			for(Produto p : lista6) {
				imaiscaro2 = p.getProdutotitulo();
				maiscaro2 = p.getProdutovalor();										
			}

			if(maiscaro1 >= maiscaro2) {
				double maiscaro = maiscaro1;
				String imaiscaro = imaiscaro1;
				request.setAttribute("imaiscaro", imaiscaro);
				request.setAttribute("maiscaro", maiscaro);
			} else if(maiscaro2 > maiscaro1) {
				double maiscaro = maiscaro2;
				String imaiscaro = imaiscaro2;
				request.setAttribute("imaiscaro", imaiscaro);
				request.setAttribute("maiscaro", maiscaro);
			}


			List<CarrinhoCompras> lista11 = bo.obterComentarios(p1);
			String coment1 = null;
			for (CarrinhoCompras c : lista11) {
				coment1 = c.getComentarios();
			}
			request.setAttribute("coment1", coment1);

			List<CarrinhoCompras> lista12 = bo.obterComentarios(p2);
			String coment2 = null;
			for (CarrinhoCompras c : lista12) {
				coment2 = c.getComentarios();
				}
			request.setAttribute("coment2", coment2);	
			
			List<CarrinhoCompras> lista13 = bo.obterQuantidadeItens(p1);
			int q1 = 0;
			for (CarrinhoCompras c : lista13) {
				q1 = c.getPedidoid();
			}
			request.setAttribute("q1", q1);	

			List<CarrinhoCompras> lista14 = bo.obterQuantidadeItens(p2);
			int q2 = 0;
			for (CarrinhoCompras c : lista14) {
				q2 = c.getPedidoid();
			}
			request.setAttribute("q2", q2);	
					
			request.setAttribute("ok", ok);
			RequestDispatcher rd = request.getRequestDispatcher("equiparativo.jsp");
			rd.include(request, response);		


		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
