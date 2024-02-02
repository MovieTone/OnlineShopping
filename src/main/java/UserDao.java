
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao {

	private static final String DB_URL = "jdbc:mysql://localhost/onlineshopping";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static Connection conn = null;

	public UserDao() {
		connect();
	}

	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// Unable to load driver
		}
		try {
			conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		} catch (SQLException e) {

		}
	}

	public boolean isValid(String user, String password) {
		boolean valid = true;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT * FROM customer u WHERE u.customer_number='" + user + "' and u.passwd = " + "MD5('"
					+ password + "')";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if (!rs.isBeforeFirst()) {
				valid = false;
			}
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}
		}
		
		return valid;
	}

	public boolean isValidManager(String user, String password) {
		boolean valid = true;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT * FROM manager u WHERE u.manager_number='" + user + "' and u.passwd = " + "MD5('"
					+ password + "')";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			if (!rs.isBeforeFirst()) {
				valid = false;
			}
		} catch (SQLException e) {
			System.out.println("SQL error");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}
		}
		
		return valid;
	}

}
