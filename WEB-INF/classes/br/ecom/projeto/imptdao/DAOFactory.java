package br.ecom.projeto.imptdao;

import br.ecom.projeto.interfaces.CadastroDAO;
import br.ecom.projeto.interfaces.CarrinhoComprasDAO;
import br.ecom.projeto.interfaces.CatalogoDAO;
import br.ecom.projeto.interfaces.CategoriaDAO;
import br.ecom.projeto.interfaces.EquiparativoDAO;
import br.ecom.projeto.interfaces.OfertasDAO;
import br.ecom.projeto.interfaces.SubCategoriaDAO;

public abstract class DAOFactory {

		public static final int MySQL = 1;
		public static final int Oracle = 2;
		 
		private static DAOFactory MySQLDAOFactory = null;
		private static DAOFactory OracleDAOFactory = null;

		public static DAOFactory getDAOFactory (int whichFactory) {

		    switch (whichFactory) {

		    case MySQL:
		        if (MySQLDAOFactory == null)
		            MySQLDAOFactory = new MySQLDAOFactory();

		        return MySQLDAOFactory;

		    case Oracle:

		        if (OracleDAOFactory == null)
		            OracleDAOFactory = new OracleDAOFactory();

		        return OracleDAOFactory;

		    default:
		        return null;

		    }
		}

		public abstract CadastroDAO getCadastroDAO(); 
		public abstract CarrinhoComprasDAO getCarrinhoDAO();
		public abstract CatalogoDAO getCatalogoDAO();
		public abstract CategoriaDAO getCategoriaDAO();
		public abstract EquiparativoDAO getEquiparativoDAO();
		public abstract OfertasDAO getOfertasDAO();
		public abstract SubCategoriaDAO getSubCategoriaDAO();

		}
