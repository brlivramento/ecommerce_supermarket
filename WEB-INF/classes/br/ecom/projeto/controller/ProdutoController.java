package br.ecom.projeto.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.models.Produto;

public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ProdutoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(); 
		
		int codigo = Integer.parseInt(request.getParameter("txtCODIGO"));
		String titulo = request.getParameter("txtTITULO");
		String descricao = request.getParameter("txtDESCRICAO");
		String imagem = request.getParameter("txtIMAGEM");
		Double valor = Double.parseDouble(request.getParameter("txtVALOR"));
				
		try {
			
			Produto produto = new Produto();
			produto.setProdutoid(codigo);
			produto.setProdutotitulo(titulo);
			produto.setProdutodescricao(descricao);
			produto.setProdutoimagem(imagem);
			produto.setProdutovalor(valor);

			session.setAttribute("produto", produto);

			RequestDispatcher rd = request.getRequestDispatcher("carrinho-produto.jsp");
			rd.include(request, response);

		} catch (Exception e) {
			throw new ServletException(e);
		}

	}
}
