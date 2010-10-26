package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.CatalogoDAO;
import br.ecom.projeto.models.Categoria;
import br.ecom.projeto.models.Produto;
import br.ecom.projeto.models.SubCategoria;

public class OracleCatalogoDAO implements CatalogoDAO {
	public List<Produto> obterCategoria(Categoria cat) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		
		List<Produto> lista = new ArrayList<Produto>();
		
		try {
			
			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_produto.produto_id, tab_produto.produto_titulo, tab_produto.produto_descricao, tab_produto.produto_imagem, tab_produto.produto_valor from tab_produto inner join tab_subcategoria on (tab_produto.subcat_id = tab_subcategoria.subcat_id) where tab_subcategoria.categoria_id = ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, cat.getCategoriaid());
			
			rs = ps.executeQuery();

			while (rs.next()) {
				
				Produto produto = new Produto();		
				produto.setProdutoid(rs.getInt("produto_id"));
				produto.setProdutotitulo(rs.getString("produto_titulo"));
				produto.setProdutodescricao(rs.getString("produto_descricao"));
				produto.setProdutoimagem(rs.getString("produto_imagem"));
				produto.setProdutovalor(rs.getDouble("produto_valor"));				
				lista.add(produto);
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

	public List<Produto> obterDescricao(String descricao) {
		ResultSet rs   = null;
		PreparedStatement ps = null;		
		List<Produto> lista = new ArrayList<Produto>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();
      
			String sql = "select * from tab_produto where produto_descricao like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + descricao + "%");
			
			rs = ps.executeQuery();

			while (rs.next())  {

				Produto produto = new Produto();
				produto.setProdutoid(rs.getInt("produto_id"));
				produto.setProdutotitulo(rs.getString("produto_titulo"));
				produto.setProdutodescricao(rs.getString("produto_descricao"));
				produto.setProdutoimagem(rs.getString("produto_imagem"));
				produto.setProdutovalor(rs.getDouble("produto_valor"));			


				lista.add(produto);
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

	public List<Produto> obterMarca(String marca) {
		ResultSet rs   = null;
		PreparedStatement ps = null;		
		List<Produto> lista = new ArrayList<Produto>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();
      
			String sql = "select * from tab_produto where produto_titulo like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + marca + "%");
			
			rs = ps.executeQuery();

			while (rs.next())  {

				Produto produto = new Produto();
				produto.setProdutoid(rs.getInt("produto_id"));
				produto.setProdutotitulo(rs.getString("produto_titulo"));
				produto.setProdutodescricao(rs.getString("produto_descricao"));
				produto.setProdutoimagem(rs.getString("produto_imagem"));
				produto.setProdutovalor(rs.getDouble("produto_valor"));			


				lista.add(produto);
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

	public List<Produto> obterSubcategorias(SubCategoria sub) {
		ResultSet rs   = null;
		PreparedStatement ps = null;		
		List<Produto> lista = new ArrayList<Produto>();
		
		try {
			
			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_produto.produto_id, tab_produto.produto_titulo, tab_produto.produto_descricao, tab_produto.produto_imagem, tab_produto.produto_valor from tab_produto where tab_produto.subcat_id = ? ORDER BY tab_produto.produto_titulo ASC";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, sub.getSubcatid());
			
			rs = ps.executeQuery();

			while (rs.next()) {
				
				Produto produto = new Produto();
				produto.setProdutoid(rs.getInt("produto_id"));
				produto.setProdutotitulo(rs.getString("produto_titulo"));
				produto.setProdutodescricao(rs.getString("produto_descricao"));
				produto.setProdutoimagem(rs.getString("produto_imagem"));
				produto.setProdutovalor(rs.getDouble("produto_valor"));
								
				lista.add(produto);
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