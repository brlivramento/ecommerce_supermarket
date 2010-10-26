package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.EquiparativoDAO;
import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.Login;
import br.ecom.projeto.models.Produto;

public class OracleEquiparativoDAO implements EquiparativoDAO{

	public List<CarrinhoCompras> obterId (int login) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<CarrinhoCompras> equip1 = new ArrayList<CarrinhoCompras>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select * from tab_carrinhocompras where login_id = ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, login);
	
			
			rs = ps.executeQuery();

			while (rs.next()) {
				CarrinhoCompras pedido = new CarrinhoCompras();
				pedido.setPedidoid(rs.getInt("pedido_id"));
				pedido.setPedidodata(rs.getString("pedido_data"));
				pedido.setPedidototal(rs.getDouble("pedido_total"));
				pedido.setComentarios(rs.getString("pedido_comentarios"));
				Login lg = new Login();
				lg.setLoginid(rs.getInt("login_id"));
				pedido.setLogin(lg);
				equip1.add(pedido);
			}
			
			}catch(SQLException e) {
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
			return equip1;
		}
	
	public List<CarrinhoCompras> obterQuantidadeItens(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		int quantidade = 0;
		List<CarrinhoCompras> equip2 = new ArrayList<CarrinhoCompras>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "SELECT count(*) FROM tab_itemcarrinho where pedido_id = ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				CarrinhoCompras pedido = new CarrinhoCompras();
				quantidade = rs.getInt("count(*)");
				pedido.setPedidoid(quantidade);
				equip2.add(pedido);
			}
			
			}catch(SQLException e) {
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
			return equip2;
		}

	public List<CarrinhoCompras> obterComentarios(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<CarrinhoCompras> equip3 = new ArrayList<CarrinhoCompras>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select pedido_comentarios from tab_carrinhocompras where pedido_id = ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				CarrinhoCompras pedido = new CarrinhoCompras();
				pedido.setComentarios(rs.getString("pedido_comentarios"));
				equip3.add(pedido);
			}
			
			}catch(SQLException e) {
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
			return equip3;
		}

	public List<Produto> obterItemMaisBarato(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<Produto> equip4 = new ArrayList<Produto>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_produto.produto_titulo from tab_itemcarrinho inner join tab_produto on (tab_produto.produto_id = tab_itemcarrinho.produto_id) where tab_itemcarrinho.pedido_id = ? order by tab_produto.produto_valor desc";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				Produto p = new Produto();
				p.setProdutotitulo(rs.getString("produto_titulo"));
				equip4.add(p);
			}
			
			}catch(SQLException e) {
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
			return equip4;
		}

	public List<Produto> obterItemMaisCaro(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<Produto> equip5 = new ArrayList<Produto>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_produto.produto_titulo from tab_itemcarrinho inner join tab_produto on (tab_produto.produto_id = tab_itemcarrinho.produto_id) where tab_itemcarrinho.pedido_id = ? order by tab_produto.produto_valor asc";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				Produto p = new Produto();
				p.setProdutotitulo(rs.getString("produto_titulo"));
				equip5.add(p);
			}
			
			}catch(SQLException e) {
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
			return equip5;
			}

	public List<Produto> obterPrecoMaisBarato(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<Produto> equip6 = new ArrayList<Produto>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_produto.produto_valor from tab_itemcarrinho inner join tab_produto on (tab_produto.produto_id = tab_itemcarrinho.produto_id) where tab_itemcarrinho.pedido_id = ? order by tab_produto.produto_valor asc";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
					Produto p = new Produto();
					p.setProdutovalor(rs.getDouble("produto_valor"));
					equip6.add(p);
				}
			
			}catch(SQLException e) {
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
			return equip6;
		}
	
	public List<Produto> obterPrecoMaisCaro(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<Produto> equip7 = new ArrayList<Produto>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_produto.produto_valor from tab_itemcarrinho inner join tab_produto on (tab_produto.produto_id = tab_itemcarrinho.produto_id) where and tab_itemcarrinho.pedido_id = ? order by tab_produto.produto_valor desc";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				Produto p = new Produto();
				p.setProdutovalor(rs.getDouble("produto_valor"));
				equip7.add(p);
			}
			
			}catch(SQLException e) {
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
			return equip7;
		}
	
	public List<CarrinhoCompras> obterTotal(int ccompras) {
		PreparedStatement ps = null;
		ResultSet rs   = null;	
		List<CarrinhoCompras> equip8 = new ArrayList<CarrinhoCompras>();
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select pedido_total from tab_carrinhocompras where pedido_id = ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setInt(1, ccompras);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				CarrinhoCompras pedido = new CarrinhoCompras();
 				pedido.setPedidototal(rs.getDouble("pedido_total"));
				equip8.add(pedido);
			}
			
			}catch(SQLException e) {
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
			return equip8;
		}
}

