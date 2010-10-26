package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.CarrinhoComprasDAO;
import br.ecom.projeto.models.CarrinhoCompras;
import br.ecom.projeto.models.ItemC;

public class OracleCarrinhoComprasDAO implements CarrinhoComprasDAO {

	public List<CarrinhoCompras> getPedido() {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<CarrinhoCompras> carrinho = null;

		try {
			ConnectionManager.getInstance().obterConexaoMySQL();
			String sql = "select pedido_data, pedido_total, pedido_comentarios from tab_carrinhocompras";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				carrinho = new ArrayList<CarrinhoCompras>();
				CarrinhoCompras pedido = new CarrinhoCompras();

				pedido.setPedidodata(rs.getString("pedido_data"));
				pedido.setPedidototal(rs.getDouble("pedido_total"));
				pedido.setComentarios(rs.getString("pedido_comentarios"));

				carrinho.add(pedido);
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
		return carrinho;
	}


	public void setPedido(CarrinhoCompras pedido) {	
		ResultSet rs   = null;
		PreparedStatement ps = null;
		String sql = null;

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			sql = "insert into tab_carrinhocompras (pedido_data, pedido_total, pedido_comentarios, login_id) values(?,?,?,?)";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, pedido.getPedidodata());
			ps.setDouble(2, pedido.getPedidototal());
			ps.setString(3, pedido.getComentarios());
			ps.setInt(4, pedido.getLogin().getLoginid());
			ps.execute();

			sql = "SELECT seq.curval AS pedido_id";
			rs = ps.executeQuery(sql);
			rs.next();
			int pid = rs.getInt("pedido_id");

			List<ItemC> itens = pedido.getItens();
			
			for (ItemC item : itens) {
				sql = "insert into tab_itemcarrinho(itemcarr_quantidade, produto_id, pedido_id) values(?,?,?)";
				ps = ConnectionManager.getConn().prepareStatement(sql);
				ps.setInt(1, item.getItemcquantidade());
				ps.setInt(2, item.getProduto().getProdutoid());
				ps.setInt(3, pid);
				ps.execute();

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
	}
}
