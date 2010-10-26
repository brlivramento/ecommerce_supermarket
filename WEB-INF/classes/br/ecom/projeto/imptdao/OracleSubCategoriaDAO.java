package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.SubCategoriaDAO;
import br.ecom.projeto.models.SubCategoria;

public class OracleSubCategoriaDAO implements SubCategoriaDAO{
	
	public List<SubCategoria> getSubCategoria() {
		PreparedStatement ps = null;
		ResultSet rs  = null;
		List<SubCategoria> lista = new ArrayList<SubCategoria>();

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select subcat_id, subcat_descricao from tab_subcategoria ORDER BY subcat_descricao ASC";
			ps = ConnectionManager.getConn().prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {

				SubCategoria subcategoria = new SubCategoria();
				subcategoria.setSubcatid(rs.getInt("subcat_id"));
				subcategoria.setSubcatdescricao(rs.getString("subcat_descricao"));														
				lista.add(subcategoria);

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
