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

import br.ecom.projeto.models.ItemC;
import br.ecom.projeto.models.Produto;

public class ItemCController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
				
		HttpSession session = request.getSession();
		
		if(session.getAttribute("produto") != null) {
			
			Produto produto = (Produto)session.getAttribute("produto");
			
			int j = 0;
			double total = 0;
			int controle2 = 0;
						
			for (int i = 0; i < j; i++){}
			
			ItemC item = new ItemC();
			item.setItemcid(j);
			controle2 ++;
			item.setItemcquantidade(Integer.parseInt(request.getParameter("txtQUANTIDADE")));
		    item.setProduto(produto);
		    total = (item.getItemcquantidade() * item.getProduto().getProdutovalor());
		    item.setTotal(total);	
		    
		   						
		    if (session.getAttribute("lista") != null){	
		    	List<ItemC> lista = (List<ItemC>)session.getAttribute("lista");
		      	lista.add(item);
		    	session.setAttribute("lista", lista);
		    	session.setAttribute("controle2", controle2);
		   
		    } else {
		    	List<ItemC> lista = new ArrayList<ItemC>();
		    	lista.add(item);
		    	session.setAttribute("lista", lista);
		    	session.setAttribute("controle2", controle2);
		    }
	    }
		
		RequestDispatcher rd = request.getRequestDispatcher("meu-carrinho.jsp");
		rd.include(request, response);
	}

}
