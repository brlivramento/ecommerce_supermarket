package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.bo.CadastroNegocio;
import br.ecom.projeto.models.Email;
import br.ecom.projeto.models.Endereco;
import br.ecom.projeto.models.Login;
import br.ecom.projeto.models.Telefone;

public class ListaEnderecoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		Login login = (Login)session.getAttribute("usuario");
		String l = login.getLogindescricao();

		CadastroNegocio bo = new CadastroNegocio();
		List<Endereco> lis = bo.obterEndereco(l);
		List<Email> lis2 = bo.obterEmail(l);
		List<Telefone> lis3 = bo.obterTelefone(l);

		session.setAttribute("lis3", lis3);
		session.setAttribute("lis2", lis2);
		session.setAttribute("lis", lis);
		
		RequestDispatcher rd = request.getRequestDispatcher("pedido-comp.jsp");
		rd.forward(request, response);
	}

}
