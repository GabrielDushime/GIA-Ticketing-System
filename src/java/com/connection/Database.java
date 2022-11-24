
package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {
    	private String hostName = "jdbc:mysql://localhost:3306/gia";
	private String userName = "root";
	private String userPassword = "";
	public Statement statement;
	private Connection con;
	public Database() {
		this.con = null;
		this.statement = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = DriverManager.getConnection(hostName,userName,userPassword);
			this.statement = this.con.createStatement();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
