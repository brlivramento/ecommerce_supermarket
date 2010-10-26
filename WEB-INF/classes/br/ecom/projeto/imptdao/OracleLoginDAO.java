package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.LoginDAO;
import br.ecom.projeto.models.Login;

public class OracleLoginDAO implements LoginDAO{

	public boolean verficaLogin(Login usuario) {
		ResultSet rs   = null;
		PreparedStatement ps = null;

		boolean existe = false;
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_login.login_descricao, tab_login.login_senha from tab_login inner join tab_cliente on (tab_login.cliente_id = tab_cliente.cliente_id)where tab_login.login_descricao like ? and  tab_login.login_senha like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + usuario.getLogindescricao());
			ps.setString(2, "%" + usuario.getLoginsenha());

			rs = ps.executeQuery();

			while (rs.next())  {

				Login login = new Login();
				login.setLogindescricao(rs.getString("login_descricao"));
				login.setLoginsenha(rs.getString("login_senha"));
				existe = true;
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
		return existe;
	}
	
	public List<Login> obterNome(String usuario) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<Login> llogin = null;
		
		
		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select * from tab_login where login_descricao like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + usuario);
			
			rs = ps.executeQuery();

			while (rs.next())  {

				llogin = new ArrayList<Login>();
				Login login = new Login();
				login.setLoginid(rs.getInt("login_id"));
				login.setLogindescricao(rs.getString("login_descricao"));
				login.setLoginsenha(rs.getString("login_senha"));
				llogin.add(login);
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
		return llogin;
	}

}
