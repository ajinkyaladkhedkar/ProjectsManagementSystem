<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Deadlines</title>
<link rel="stylesheet" type="text/css" href="login_prop.css">
</head>
<body>
<% 
		
		Connection con = null;

		try {
			//step1 load the driver class 
			Class.forName("oracle.jdbc.pool.OracleDataSource");
			//step2 create  the connection object 
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE", "system",
					"ajinkya");

			//step3 create the statement object 
			Statement stmt = con.createStatement();
		
			
			//step4 execute query 
			String query = "select * from deadline_details";
		    ResultSet rs = stmt.executeQuery(query);

		    while(rs.next())
		    {
		    %>
		    <table border="1">
		     <tr> 
		     <th> Deadline No. </th>
		     <th> Deadline Details </th>
		     <th> Submit Date </th>
		    </tr>
		    <tr>
		    <td><%=rs.getString("deadlineid") %> </td>
		    <td><%=rs.getString("deadlinename") %> </td>
		    <td><%=rs.getString("submitdate") %> </td>
		    </tr>
		    </table>
		    <%
		    }
				stmt.close();

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body>
</html>