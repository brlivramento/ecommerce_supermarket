package br.ecom.projeto.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.ecom.projeto.bo.CarrinhoComprasNegocio;
import br.ecom.projeto.bo.LoginNegocio;
import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.ItemC;
import br.ecom.projeto.models.Login;

public class PersistenciaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		List<ItemC> lista = (List<ItemC>)session.getAttribute("lista");
		Login usuario = (Login) session.getAttribute("usuario");
		String v = usuario.getLogindescricao();
				
		CarrinhoComprasNegocio bo = new CarrinhoComprasNegocio();
		CarrinhoCompras car = new CarrinhoCompras();
		
		Date data = new Date();  
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
		String datahoje = formatador.format(data);
		
		car.setPedidodata(datahoje); 
		
		if(request.getParameter("txtCOMENT")!= null) {
			car.setComentarios((String)session.getAttribute("comentarios"));
		} else {
			car.setComentarios(null); 
		}
		
		car.setPedidototal((Double) session.getAttribute("carrinhototal"));
		car.setItens(lista);
		
		LoginNegocio bo2 = new LoginNegocio();
	    List<Login> nlg = bo2.obterNome(v);
	   
	    for (Login u : nlg){
			u.getLoginid();		
			car.setLogin(u);
		}
	    
		bo.setPedido(car);
		
		RequestDispatcher rd = request.getRequestDispatcher("ListaEnderecoController");
		rd.include(request, response);
		
		
	}

}
