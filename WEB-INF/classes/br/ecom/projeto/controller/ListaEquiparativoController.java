package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.bo.EquiparativoNegocio;
import br.ecom.projeto.bo.LoginNegocio;
import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.Login;


public class ListaEquiparativoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
   
		HttpSession session = request.getSession();
		
		try {
			
			Login lg = (Login) session.getAttribute("usuario");
			String v = lg.getLogindescricao();
			
			LoginNegocio bo = new LoginNegocio();
		    List<Login> nlg = bo.obterNome(v);
		   
		    int id = 0;
		    
		    for (Login u : nlg){
		    	id = u.getLoginid();
		    }
		    								
			EquiparativoNegocio bo2 = new EquiparativoNegocio();
			List<CarrinhoCompras> lista = bo2.obterId(id);		
			
			request.setAttribute("lista", lista);			
			RequestDispatcher rd = request.getRequestDispatcher("equiparativo.jsp");
			rd.forward(request, response);
								
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

