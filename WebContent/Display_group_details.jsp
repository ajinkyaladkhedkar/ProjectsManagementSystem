<%@page import="java.awt.event.ActionListener"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display_group_details</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">
	<table>
		<tr>
			<td><a href="Group_details.html"><h4 align="left">Previous</h4></a></td>
		</tr>
	</table>
	<%
int group_id=Integer.parseInt(request.getParameter("group_id"));

Connection con1 = null;
Connection con2 = null;

	try {
			//step1 load the driver class 
			Class.forName("oracle.jdbc.pool.OracleDataSource");
			//step2 create  the connection object 
			con1 = DriverManager.getConnection(
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE", "system",
					"ajinkya");

			con2 = DriverManager.getConnection(
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE", "system",
					"ajinkya");

			//step3 create the statement object 
			Statement stmt1 = con1.createStatement();
			Statement stmt2 = con2.createStatement();
			
	
			String query1 = "select project_name from group_details where group_id = "+group_id+"";
			String query2 = "select f_name,l_name,sid,email,cellnum from student_details where group_id = "+group_id+"";
			ResultSet rs1=stmt1.executeQuery(query1);
			ResultSet rs2=stmt2.executeQuery(query2);
			rs1.next();
			%><h3>Project Name:</h3><%=rs1.getString("project_name")%><br><br>
	<table align="center">
	<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Sac State ID</th>
			<th>Email ID</th>
			<th>Cell No.</th>
		</tr>
		<%
			while(rs2.next())
			{
				%>
		
		<tr>
			<td><%=rs2.getString("f_name") %></td>
			<td><%=rs2.getString("l_name") %></td>
			<td><%=rs2.getString("sid") %></td>
			<td><%=rs2.getString("email") %></td>
			<td><%=rs2.getString("cellnum") %></td>
		</tr>
		<%
			}
			%>
	</table>
	<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
	<%
			stmt2.close();
			stmt1.close();

	
			//step5 close the connection object 
			con2.close();
			con1.close();
	}
		
		catch (Exception e)
		{
			System.out.println(e);
		}
	%>
</body>
</html>