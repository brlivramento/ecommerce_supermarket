package br.ecom.projeto.imptdao;

import br.ecom.projeto.interfaces.CadastroDAO;
import br.ecom.projeto.interfaces.CarrinhoComprasDAO;
import br.ecom.projeto.interfaces.CatalogoDAO;
import br.ecom.projeto.interfaces.CategoriaDAO;
import br.ecom.projeto.interfaces.EquiparativoDAO;
import br.ecom.projeto.interfaces.OfertasDAO;
import br.ecom.projeto.interfaces.SubCategoriaDAO;

public class OracleDAOFactory extends DAOFactory{

		public CadastroDAO getCadastroDAO() {
	        return new OracleCadastroDAO();
	    }

	    public CarrinhoComprasDAO getCarrinhoComprasDAO() {
	        return new OracleCarrinhoComprasDAO();
	    }
	    
	    public CatalogoDAO getCatalogoDAO(){
	    	return new OracleCatalogoDAO();
	    }
	    
	    public CategoriaDAO getCategoriaDAO(){
	    	return new OracleCategoriaDAO();
	    }
	    
	    public EquiparativoDAO getEquiparativoDAO(){
	    	return new OracleEquiparativoDAO();
	    }
	    
	    public OfertasDAO getOfertasDAO(){
	    	return new OracleOfertasDAO();
	    }
	    public SubCategoriaDAO getSubCategoriaDAO(){
	    	return new OracleSubCategoriaDAO();
	    }

		@Override
		public CarrinhoComprasDAO getCarrinhoDAO() {
			// TODO Auto-generated method stub
			return null;
		}
	}
