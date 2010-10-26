package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.models.ItemL;
import br.ecom.projeto.models.Produto;

public class ItemLController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		   HttpSession session = request.getSession(); 	    		    		

		    int j = 0;
			double total = 0;
			int controle = 0;
			
			try {
				
				
				String[] produtos  = request.getParameterValues("addPROD");
				String[] quantidades = request.getParameterValues("addQUATID");
				String[] descricoes = request.getParameterValues("txtDESCRICAO");
				String[] valores = request.getParameterValues("txtVALOR");
				String[] titulos = request.getParameterValues ("txtTITULO");
				
				for (int i = 0; i < quantidades.length; i++){
					
					if (!quantidades[i].equals("0")) {

						Produto produto = new Produto();

						produto.setProdutoid(Integer.parseInt(produtos[j]));	
						produto.setProdutodescricao(descricoes[i]);
						produto.setProdutotitulo(titulos[i]);
						produto.setProdutovalor(Double.parseDouble(valores[i]));

						if(session.getAttribute("controle") != null){
							controle = (Integer) session.getAttribute("controle");
						} else {
							controle = i;
						}
												
						ItemL item = new ItemL();
						item.setItemid(controle++);
						item.setItemquantidade(Integer.parseInt(quantidades[i]));
						item.setProduto(produto);
						
						total += item.getItemquantidade() * item.getProduto().getProdutovalor();
					    item.setTotal(total);
					      
												
						if (session.getAttribute("itens") != null){				
							List<ItemL> itens = (List<ItemL>)session.getAttribute("itens");
							item.setTotal(total);					
							itens.add(item);
							j++;
							session.setAttribute("controle", controle);

						} else {							
							List<ItemL> itens = new ArrayList<ItemL>();
							itens.add(item);
							j++;
							session.setAttribute("itens", itens);
							session.setAttribute("controle", controle);
						}
					}
				
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("minha-lista.jsp");
				rd.include(request, response);
			
				
			} catch (Exception e) {
				throw new ServletException(e);
			}

	}
}
