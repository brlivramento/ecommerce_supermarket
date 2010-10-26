package br.ecom.projeto.actions;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import br.ecom.projeto.bo.LoginNegocio;
import br.ecom.projeto.models.Login;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {        
   
	private static final long serialVersionUID = 1L;

	public LoginAction() {}
	
    private Login usuario;
           
    public void validate(){
    	if (usuario.getLogindescricao().length() == 0){
    		addFieldError("usuario.logindescricao", "Insira seu login");
    	}
    	if (usuario.getLoginsenha().length() == 0){
    		addFieldError("usuario.loginsenha", "Insira sua senha");
    	}
    }
    
    public String execute(){
    	if(usuario.getLogindescricao().equals("adm") && usuario.getLoginsenha().equals("adm")) {
    		HttpSession session = ServletActionContext.getRequest().getSession();
    		String administrador = "administrador";
			session.setAttribute("administrador", administrador);
			session.setAttribute("usuario", usuario);
			session.setAttribute("itens", null);
			session.setAttribute("lista", null);
			session.setAttribute("controle", null);
			session.setAttribute("controle2", null);
    		return "administrador";
    	} if(!(usuario.getLogindescricao().equals("adm") && usuario.getLoginsenha().equals("adm"))) {
    		LoginNegocio bo = new LoginNegocio();
    		bo.verficaLogin(usuario);
    		if (new LoginNegocio().verficaLogin(usuario) == true){
    			HttpSession session = ServletActionContext.getRequest().getSession();
    			session.setAttribute("usuario", usuario);
    			session.setAttribute("itens", null);
    			session.setAttribute("lista", null);
    			session.setAttribute("controle", null);
    			session.setAttribute("controle2", null);
    			return "valido";
    		} else {
    			return "invalido";
    		}
    	}
    	return SUCCESS;
    }
    	
   
	public Login getUsuario() {
		return usuario;
	}

	public void setUsuario(Login usuario) {
		this.usuario = usuario;
	}
	
}   
