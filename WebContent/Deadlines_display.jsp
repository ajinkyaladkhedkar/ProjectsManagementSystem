<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Deadlines</title>
<link rel="stylesheet" type="text/css" href="Home_page.css">
</head>
<body class="center">
<table><tr><td><a href="Manage_deadlines.html"><h4 align="left">Previous</h4></a></td></tr></table>
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
%>
		   <table align="center">
		    <tr> 
		    <th color: purple> Deadline No. </th>
		    <th> Deadline Name </th>
		    <th> Submit Date </th>
		   </tr>
		  
<%	
		   while(rs.next())
		   {
%>
	
		   <tr>
		   <td><%=rs.getString("deadid") %> </td>
		   <td><%=rs.getString("deadline_name") %> </td>
		   <td><%=rs.getString("submit_date") %> </td>
		   </tr>
		  
		   <%
		   
		   }
%>
	   </table>
<%
				stmt.close();

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
</body>
</html>
