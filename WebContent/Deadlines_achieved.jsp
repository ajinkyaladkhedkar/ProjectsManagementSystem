<%@page import="java.awt.event.ActionListener"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deadlines Achieved</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">
<table><tr><td><a href="Track_project_status.html"><h4 align="left">Previous</h4></a></td></tr></table>
	<%
int group_id=Integer.parseInt(request.getParameter("group_id"));
int deadline_catched[] = new int[50];
int i=0,k=0,l=0;
String dname[]=new String[200];
Connection con1 = null;
Connection con2 = null;
Connection con3 = null;
for(i=0;i<deadline_catched.length;i++)
{
	deadline_catched[i]=-1;
}
i=0;
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

			con3 = DriverManager.getConnection(
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE", "system",
					"ajinkya");
			//step3 create the statement object 
			Statement stmt1 = con1.createStatement();
			Statement stmt2 = con2.createStatement();
			Statement stmt3 = con3.createStatement();
	
			String query1 = "select deadid from deadline_details";
				
			ResultSet rs1=stmt1.executeQuery(query1);
		
			while(rs1.next())
			{
				deadline_catched[i]=rs1.getInt("deadid");
				
				i++;
			}
			
			
			for(int j=0;j<i;j++)
			{
				String query2="select deadline_name from deadline_details where deadid='"+deadline_catched[j]+"'";
				ResultSet rs2= stmt2.executeQuery(query2);
				rs2.next();
				dname[j]=rs2.getString("deadline_name"); 	
			}
			
			%>
	<h1>Manage Deadlines</h1>
	<form action="Deadline_update.jsp" method="post">
		<input type="hidden" name="group_id" value=<%=group_id%>> <br>
		<br>
		<table align="center">
			<%
		
			
			for(k=0;k<i;k++)
			{
			%>
			<tr>
				<td><%=deadline_catched[k] %></td>
				<td><%=dname[k]%></td>
			</tr>
			<%
		
			}
			%>
		</table><br>
	Enter the Deadline id:<input type="text" name="dead">
		<br><br> <input type="submit" name="updateme" value="UPDATE">
	</form><br><br></br>
<%
			stmt3.close();
			stmt2.close();
			stmt1.close();

	
			//step5 close the connection object 
			con3.close();
			con2.close();
			con1.close();
	}
		
		catch (Exception e)
		{
			System.out.println(e);
		}
	%>
	<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
</body>
</html>