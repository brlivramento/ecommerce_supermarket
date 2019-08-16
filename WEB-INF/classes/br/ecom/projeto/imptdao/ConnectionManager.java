package br.ecom.projeto.imptdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static Connection conn;
	
	private static ConnectionManager instance;
	
	private ConnectionManager(){}
	
	public static ConnectionManager getInstance() {
		
		if (instance == null) {
			instance = new ConnectionManager();
		}
		
		return instance;
		
	}
	
	public void obterConexaoMySQL() throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			ConnectionManager.conn = DriverManager.getConnection("jdbc:mysql://mysql:3306/ecommerce_db?useUnicode=true", "root", "root");

		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	public void obterConexaoOracle() throws SQLException {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			ConnectionManager.conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.60.15.1521:ORCL", "", "SENHA1234");

		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	public static Connection getConn() {
		return conn;
	}

	public static void closeConn() {
		if (ConnectionManager.conn != null) {
			try {
				ConnectionManager.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}
	
	public static void setConn(Connection conn) {
		ConnectionManager.conn = conn;
	}
	
	
}
