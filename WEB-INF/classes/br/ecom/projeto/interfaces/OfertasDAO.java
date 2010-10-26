package br.ecom.projeto.interfaces;

import java.util.List;

import br.ecom.projeto.models.Ofertas;

public interface OfertasDAO {
	
	public void setOferta(Ofertas oferta);
	public void delOferta(Ofertas oferta);
    public List<Ofertas> getOfertas();

}
