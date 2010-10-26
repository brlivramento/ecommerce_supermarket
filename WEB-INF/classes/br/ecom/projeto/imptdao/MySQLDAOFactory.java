package br.ecom.projeto.imptdao;

import br.ecom.projeto.interfaces.CadastroDAO;
import br.ecom.projeto.interfaces.CarrinhoComprasDAO;
import br.ecom.projeto.interfaces.CatalogoDAO;
import br.ecom.projeto.interfaces.CategoriaDAO;
import br.ecom.projeto.interfaces.EquiparativoDAO;
import br.ecom.projeto.interfaces.OfertasDAO;
import br.ecom.projeto.interfaces.SubCategoriaDAO;

public class MySQLDAOFactory extends DAOFactory{
	
	public CadastroDAO getCadastroDAO() {
        return new MySQLCadastroDAO();
    }

    public CarrinhoComprasDAO getCarrinhoDAO() {
        return new MySQLCarrinhoComprasDAO();
    }
    
    public CatalogoDAO getCatalogoDAO(){
    	return new MySQLCatalogoDAO();
    }
    
    public CategoriaDAO getCategoriaDAO(){
    	return new MySQLCategoriaDAO();
    }
    
    public EquiparativoDAO getEquiparativoDAO(){
    	return new MySQLEquiparativoDAO();
    }
    
   public OfertasDAO getOfertasDAO(){
   	return new MySQLOfertasDAO();
  }
    public SubCategoriaDAO getSubCategoriaDAO(){
    	return new MySQLSubCategoriaDAO();
    }
}
