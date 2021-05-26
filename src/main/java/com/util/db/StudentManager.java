

package com.util.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class StudentManager {
	
	public int addStudent(Student s) {
		int nb = 0;

		try {
			DBInteraction.seconnecter();
			nb = DBInteraction.edit("insert into student (login, password, etat) values('" + s.getLogin() + "', '"
					+ s.getPassword() + "','" + s.getRole() + "' )");
			DBInteraction.sedeconnecter();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;
	}
	
	public int addAdmin() {
	
		int nb=0;
		try {
			DBInteraction.seconnecter();
			nb = DBInteraction.edit("insert into student (login, password, etat) values('admin','admin','admin' )");
			DBInteraction.sedeconnecter();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;
	}
	
	public Student authentification(String log, String pass)
	{
		Student s=null;
		try {
			DBInteraction.seconnecter();
			ResultSet rs = DBInteraction.select("select * from student where login='"+log+"' and password='"+pass+"'");
			if(rs.next())
			{
				s=new Student();
				s.setId(rs.getInt(1));
				s.setLogin(rs.getString(2));
				s.setPassword(rs.getString(3));
				s.setRole(rs.getString(4));
			}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return s;
		
	}
	
	public List<Student> allStudent() {
		List<Student> ab = new ArrayList<Student>();
		try {
			DBInteraction.seconnecter();
			String sql = "select * from student ";
			ResultSet rs = DBInteraction.select(sql);
			while (rs.next()) {
				Student b = new Student();
			b.setId(rs.getInt(1));
			b.setLogin(rs.getString(2));
			b.setPassword(rs.getString(3));
			b.setRole(rs.getString(4));
			ab.add(b);
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ab;
		
	}

	
	public int deleteStudent(int id) {
		int nb = 0;

		try {
			DBInteraction.seconnecter();
			nb = DBInteraction.edit("delete from student where id=" + id);
			DBInteraction.sedeconnecter();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nb;
	}
	
}



