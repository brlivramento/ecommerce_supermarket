package br.ecom.projeto.imptdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ecom.projeto.interfaces.CadastroDAO;
import br.ecom.projeto.models.Cliente;
import br.ecom.projeto.models.Email;
import br.ecom.projeto.models.Endereco;
import br.ecom.projeto.models.Login;
import br.ecom.projeto.models.Telefone;


public class MySQLCadastroDAO implements CadastroDAO {

	public void incluirCadastro(Telefone telefone, Email email, Endereco endereco, Cliente cliente, Login login) {
		
		PreparedStatement ps = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
		
		ConnectionManager.getInstance().obterConexaoMySQL();
		
		sql = "insert into tab_telefone(telefone_numero, telefone_ddd, telefone_tipo) values(?,?,?)";
		ps = ConnectionManager.getConn().prepareStatement(sql);		
		ps.setInt(1, telefone.getTelefonenumero());
		ps.setInt(2, telefone.getTelefoneddd());
		ps.setString(3, telefone.getTelefonetipo());
		ps.execute();
		
		sql = "SELECT LAST_INSERT_ID() AS telefone_id";
		rs = ps.executeQuery(sql);
		rs.next();
		int telefoneid = rs.getInt("telefone_id");
		
		sql = "insert into tab_email(email_descricao) values(?)";
		ps = ConnectionManager.getConn().prepareStatement(sql);
    	ps.setString(1, email.getEmaildescricao());
		ps.execute();
		
		sql = "SELECT LAST_INSERT_ID() AS email_id";
		rs = ps.executeQuery(sql);
		rs.next();
		int emailid = rs.getInt("email_id");
				
		sql = "insert into tab_endereco(end_logradouro, end_numero, end_complemento, end_cep, end_bairro, end_cidade, end_estado, end_tipo) values (?,?,?,?,?,?,?,?)";
		ps = ConnectionManager.getConn().prepareStatement(sql);
		ps.setString(1, endereco.getEndlogradouro());
		ps.setInt(2, endereco.getEndnumero());
		ps.setString(3, endereco.getEndcomplemento());
		ps.setInt(4, endereco.getEndcep());
		ps.setString(5, endereco.getEndbairro());
		ps.setString(6, endereco.getEndcidade());
		ps.setString(7, endereco.getEndestado());
		ps.setString(8, endereco.getEndtipo());
		ps.execute();
		
		sql = "SELECT LAST_INSERT_ID() AS end_id";
		rs = ps.executeQuery(sql);
		rs.next();
		int endid = rs.getInt("end_id");
		
		sql = "insert into tab_cliente (cliente_nome, cliente_sexo, cliente_rg, cliente_cpf, cliente_datanasc, telefone_id, email_id, end_id) VALUES(?,?,?,?,?,?,?,?)";
		ps = ConnectionManager.getConn().prepareStatement(sql);
		ps.setString(1, cliente.getClientenome());
		ps.setString(2, cliente.getClientesexo());
		ps.setLong(3, cliente.getClienterg());
		ps.setLong(4, cliente.getClientecpf());
		ps.setString(5, cliente.getClientedatanasc());
		ps.setInt(6, telefoneid);
		ps.setInt(7, emailid);
		ps.setInt(8, endid);
		ps.execute();
		
		sql = "SELECT LAST_INSERT_ID() AS cliente_id";
		rs = ps.executeQuery(sql);
		rs.next();
		int cliid = rs.getInt("cliente_id");
		
		sql = "insert into tab_login(login_descricao, login_senha, cliente_id) values(?,?,?)";
		ps = ConnectionManager.getConn().prepareStatement(sql);
		ps.setString(1, login.getLogindescricao());
		ps.setString(2, login.getLoginsenha());
		ps.setInt(3, cliid);
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

	
	
	public void alterarEmail(Email email) {
		
		PreparedStatement ps = null;

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();
			
			String sql = "update tab_email set email_descricao = ? where email_id = ?";	
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, email.getEmaildescricao());
			ps.setInt(2, email.getEmailid());
			ps.executeUpdate();
			
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
		

	
	public void alterarEndereco(Endereco endereco) {

		PreparedStatement ps = null;

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();
			
			String sql = "update tab_endereco set end_logradouro = ?, end_numero = ?, end_complemento = ?, end_cep = ?, end_bairro = ?, end_cidade = ?, end_estado = ?, end_tipo = ? where end_id = ?";	
			ps = ConnectionManager.getConn().prepareStatement(sql);
			
			ps.setString(1, endereco.getEndlogradouro());
			ps.setInt(2, endereco.getEndnumero());
			ps.setString(3, endereco.getEndcomplemento());
			ps.setInt(4, endereco.getEndcep());
			ps.setString(5, endereco.getEndbairro());
			ps.setString(6, endereco.getEndcidade());
			ps.setString(7, endereco.getEndestado());
			ps.setString(8, endereco.getEndtipo());
			ps.setInt(9, endereco.getEndid());
			ps.executeUpdate();
			
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

	
	public void alterarTelefone(Telefone telefone) {
		
		PreparedStatement ps = null;

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();
			
			String sql = "update tab_telefone set telefone_numero = ?, telefone_ddd = ?, telefone_tipo = ? WHERE telefone_id = ?"; 
			ps = ConnectionManager.getConn().prepareStatement(sql);
			
			ps.setInt(1, telefone.getTelefonenumero());
			ps.setInt(2, telefone.getTelefoneddd());
			ps.setString(3, telefone.getTelefonetipo());
			ps.setInt(4, telefone.getTelefoneid());
			
			ps.executeUpdate();
			
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



	
	public List<Cliente> obterCliente(String login) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<Cliente> lista = new ArrayList<Cliente>();


		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select * from tab_cliente inner join  tab_login on (tab_login.cliente_id = tab_cliente.cliente_id) where tab_login.login_descricao like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + login);

			rs = ps.executeQuery();

			while (rs.next()) {

				Cliente cliente = new Cliente();
				cliente.setClientenome(rs.getString("cliente_nome"));
				cliente.setClientedatanasc(rs.getString("cliente_dtnasc"));
				cliente.setClientecpf(rs.getInt("cliente_cpf"));
				cliente.setClienteid(rs.getInt("cliente_id"));
				cliente.setClienterg(rs.getInt("cliente_rg"));
				cliente.setClientesexo(rs.getString("cliente_sexo"));
				lista.add(cliente);
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




	
	public List<Email> obterEmail(String login) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<Email> lista = new ArrayList<Email>();

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select * from tab_email inner join tab_cliente on (tab_cliente.email_id = tab_email.email_id) inner join tab_login on (tab_login.cliente_id = tab_cliente.cliente_id) where tab_login.login_descricao like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + login);

			rs = ps.executeQuery();

			while (rs.next()) {
				Email email = new Email();
				email.setEmaildescricao(rs.getString("email_descricao"));
				email.setEmailid(rs.getInt("email_id"));
				lista.add(email);
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

	
	public List<Endereco> obterEndereco(String login) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<Endereco> lista = new ArrayList<Endereco>();

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select * from tab_endereco inner join tab_cliente on (tab_cliente.end_id = tab_endereco.end_id) inner join tab_login on (tab_login.cliente_id = tab_cliente.cliente_id) where tab_login.login_descricao like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + login);

			rs = ps.executeQuery();

			while (rs.next()) {
				Endereco end = new Endereco();
				end.setEndbairro(rs.getString("end_bairro"));
				end.setEndcep(rs.getInt("end_cep"));
				end.setEndcidade(rs.getString("end_cidade"));
				end.setEndcomplemento(rs.getString("end_complemento"));
				end.setEndestado(rs.getString("end_estado"));
				end.setEndid(rs.getInt("end_id"));
				end.setEndlogradouro(rs.getString("end_logradouro"));
				end.setEndnumero(rs.getInt("end_numero"));
				end.setEndtipo(rs.getString("end_tipo"));
				lista.add(end);
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


	
	public List<Telefone> obterTelefone(String login) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<Telefone> lista = new ArrayList<Telefone>();

		try {

			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select * from tab_telefone inner join tab_cliente on (tab_cliente.telefone_id = tab_telefone.telefone_id) inner join tab_login on (tab_login.cliente_id = tab_cliente.cliente_id) where tab_login.login_descricao like ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, "%" + login);

			rs = ps.executeQuery();

			while (rs.next()) {
				Telefone fone = new Telefone();
				fone.setTelefoneid(rs.getInt("telefone_id"));
				fone.setTelefoneddd(rs.getInt("telefone_ddd"));
				fone.setTelefonenumero(rs.getInt("telefone_numero"));
				fone.setTelefonetipo(rs.getString("telefone_tipo"));
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


	public List<Cliente> obterId (Login login) {
		ResultSet rs   = null;
		PreparedStatement ps = null;
		List<Cliente> lista = null;
		
		try {
			
			ConnectionManager.getInstance().obterConexaoMySQL();

			String sql = "select tab_cliente.email_id, tab_cliente.telefone_id, tab_cliente.end_id from tab_cliente inner join tab_login on (tab_login.cliente_id = tab_cliente.cliente_id) where tab_login.login_descricao = ?";
			ps = ConnectionManager.getConn().prepareStatement(sql);
			ps.setString(1, login.getLogindescricao());
			
			rs = ps.executeQuery();

			while (rs.next()) {
				
				Cliente cli = new Cliente();
				Email email = new Email();
				email.setEmailid(rs.getInt("email_id"));
				cli.setEmail(email);
				Telefone fone = new Telefone();
				fone.setTelefoneid(rs.getInt("telefone_id"));
				cli.setTelefone(fone);
				Endereco end = new Endereco();
				end.setEndid(rs.getInt("end_id"));
				cli.setEnd(end);
				lista = new ArrayList<Cliente>();
				lista.add(cli);			
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
