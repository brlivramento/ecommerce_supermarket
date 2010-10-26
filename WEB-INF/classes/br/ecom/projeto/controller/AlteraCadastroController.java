package br.ecom.projeto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ecom.projeto.bo.CadastroNegocio;
import br.ecom.projeto.models.Cliente;
import br.ecom.projeto.models.Email;
import br.ecom.projeto.models.Endereco;
import br.ecom.projeto.models.Telefone;

public class AlteraCadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		try {
			
			CadastroNegocio bo = new CadastroNegocio();
			List<Cliente> lista = (List<Cliente>) request.getAttribute("lista");
			
			if (request.getParameter("buttonEmail")!= null) {	
				Email email = new Email();
				email.setEmailid(Integer.parseInt(request.getParameter("txtIDEMAIL")));
				email.setEmaildescricao(request.getParameter("txtEMAIL"));				
				bo.alterEmail(email);
				String ok = "ok";
				request.setAttribute("lista", lista);
				request.setAttribute("ok", ok);			
			}
			
			if (request.getParameter("buttonEndereco")!= null) {	
				Endereco end = new Endereco();
				end.setEndid(Integer.parseInt(request.getParameter("txtIDENDERECO")));
				end.setEndlogradouro(request.getParameter("txtLOGRADOURO"));
				end.setEndcomplemento(request.getParameter("txtCOMPLEMENTO"));
				end.setEndestado(request.getParameter("selESTADO"));
				end.setEndbairro(request.getParameter("txtBAIRRO"));
				end.setEndcep(Integer.parseInt(request.getParameter("txtCEP")));
				end.setEndcidade(request.getParameter("txtCIDADE"));
				end.setEndnumero(Integer.parseInt(request.getParameter("txtNUMERO")));
				end.setEndtipo(request.getParameter("selENDTIPO"));
				bo.alterEndereco(end);
				String ok2 = "ok";
				request.setAttribute("ok", ok2);
				request.setAttribute("lista", lista);
			}
			
			if (request.getParameter("buttonTelefone")!= null) {	
				Telefone fone = new Telefone();
				fone.setTelefoneid(Integer.parseInt(request.getParameter("txtIDTELEFONE")));
				fone.setTelefoneddd(Integer.parseInt(request.getParameter("txtDDD")));
				fone.setTelefonenumero(Integer.parseInt(request.getParameter("txtTELEFONE")));
				fone.setTelefonetipo(request.getParameter("selTELTIPO"));
				bo.alterTelefone(fone);
				String ok3 = "ok";
				request.setAttribute("ok", ok3);
				request.setAttribute("lista", lista);
				
			}
			
		
			RequestDispatcher rd = request.getRequestDispatcher("ListaAltCadastroController");
			rd.forward(request, response);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
