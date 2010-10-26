package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.OfertasDAO;
import br.ecom.projeto.models.Ofertas;
import br.ecom.projeto.models.Produto;

public class MySQLOfertasDAO implements OfertasDAO {

	public void setOferta(Ofertas oferta) {
		PreparedStatement ps = null;
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();
			String sql = "insert into tab_oferta (oferta_desconto, produto_id) values (?,?)";	
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, oferta.getDesconto());
			ps.setInt(2, oferta.getProduto().getProdutoid());
			ps.execute();


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

	public List<Ofertas> getOfertas() {
		ResultSet rs   = null;
		PreparedStatement ps = null;


		List<Ofertas> lista = new ArrayList<Ofertas>();

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_oferta.oferta_desconto, tab_produto.produto_titulo, tab_produto.produto_descricao, tab_produto.produto_imagem, tab_produto.produto_valor from tab_oferta inner join tab_produto where tab_oferta.produto_id = tab_produto.produto_id";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			
			rs = ps.executeQuery();

			while (rs.next())  {

				Ofertas oferta = new Ofertas();
				oferta.setDesconto(rs.getString("oferta_desconto"));
				
				Produto produto = new Produto();
				
				produto.setProdutotitulo(rs.getString("produto_titulo"));
				produto.setProdutodescricao(rs.getString("produto_descricao"));
				produto.setProdutoimagem(rs.getString("produto_imagem"));
				produto.setProdutovalor(rs.getDouble("produto_valor"));
				
				oferta.setProduto(produto);
				
				lista.add(oferta);
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
	

	@Override
	public void delOferta(Ofertas oferta) {
		// TODO Auto-generated method stub
		
	}
}