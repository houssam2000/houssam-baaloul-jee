package com.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBInteraction {

	private static Connection conn;
	private static Statement stat;
	private static String url = "jdbc:mysql://localhost:3306/project";

	public static void seconnecter() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "admin", "admin");
		stat = conn.createStatement();
	}

	public static int edit(String sql) {
		int nb = 0;
		try {
			nb = stat.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;

	}

	public static ResultSet select(String sql) {
		ResultSet rs = null;
		try {
			rs = stat.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public static void sedeconnecter() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
