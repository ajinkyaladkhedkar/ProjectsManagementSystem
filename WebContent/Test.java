package prj;
import java.sql.*; 

public class Test {

	/**
	 * @param args
	 */
	public static void main(String args[]){ 
		try{ 
			//step1 load the driver class 
		
			Class.forName("oracle.jdbc.pool.OracleDataSource"); 
		
			//step2 create  the connection object 
			Connection con=DriverManager.getConnection( 
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE","system","ajinkya"); 
		
			//step3 create the statement object 
			Statement stmt=con.createStatement(); 
		
			//step4 execute query 
			ResultSet rs=stmt.executeQuery("select * from login");
			rs.next();
			
			System.out.println(rs.getString(1)); 
			System.out.println(rs.getString(2)); 
			

			//step5 close the connection object 
			con.close(); 

		}
		catch(Exception e)
		{ 
			System.out.println(e);
		} 
	} 
}
