package de.sand.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DbConnector {

	private static Connection conn = null;
	private static int num = -1;

	public static Connection getSQLConnection(Properties p) throws IOException {
		try {
			DbArt dbsorte = DbArt.getSorteFromString( p.getProperty("dbArt") );
			num = dbsorte.getNum();
			String connString = "jdbc:" + dbsorte.getTyp() + "://" + p.getProperty("server")+";database="+p.getProperty("database");

			connClose();

			if ((conn == null) || (conn.isClosed())) {
        try {
          Class.forName(dbsorte.getKlasse());
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        }
			  System.out.println(connString);
//			Bl�d, aber ojdbc14.jar ben�tigt die Zeile :(
//			DriverManager.registerDriver (new oracle.jdbc.OracleDriver());
			  conn = DriverManager.getConnection( connString, p );
			}
		} catch (SQLException e) {
			e.printStackTrace();
			SQLException nextException = e.getNextException();
			if (nextException != null) {
				nextException.printStackTrace();
			}
			throw new IOException("No Connection", e);
		}
		return conn;
	}

	public static void connClose(){
		if (conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public static int getNum(){
		return num;
	}
}
