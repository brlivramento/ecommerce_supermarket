package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.CategoriaDAO;
import br.ecom.projeto.models.Categoria;

public class OracleCategoriaDAO implements CategoriaDAO {
	
	public List<Categoria> getCategoria() {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<Categoria> lista = new ArrayList<Categoria>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select categoria_id, categoria_descricao from tab_categoria ORDER BY categoria_descricao ASC";
			ps = ConnectionManager.getConn().prepareStatement(sql);
		
			rs = ps.executeQuery();

			while (rs.next()) {

				Categoria categoria = new Categoria();
				categoria.setCategoriaid(rs.getInt("categoria_id"));
				categoria.setCategoriadescricao(rs.getString("categoria_descricao"));									
				lista.add(categoria);

			}

		} catch(SQLException e) {
			e.printStackTrace();

		} finally {

			try {

				if (ps != null) {
					ps.close();
				}	

				ConnectionManager.closeConn();	
			} catch(SQLException e) {
				e.printStackTrace();
			}

		}

		return lista;

	}

}
