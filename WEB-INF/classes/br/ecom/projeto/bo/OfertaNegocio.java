package br.ecom.projeto.bo;

import java.util.List;

import br.ecom.projeto.imptdao.MySQLOfertasDAO;
import br.ecom.projeto.interfaces.OfertasDAO;
import br.ecom.projeto.models.Ofertas;

public class OfertaNegocio {

	public void setOferta(Ofertas oferta){
		OfertasDAO dao = new MySQLOfertasDAO();
		dao.setOferta(oferta);		
	}
	
	public void delOferta(Ofertas oferta){
		OfertasDAO dao = new MySQLOfertasDAO();
		dao.delOferta(oferta);
		
	}
    
	public List<Ofertas> getOfertas(){
    	OfertasDAO dao = new MySQLOfertasDAO();
    	return dao.getOfertas();
    }
}
