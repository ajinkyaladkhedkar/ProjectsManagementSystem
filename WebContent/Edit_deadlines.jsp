<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search_student</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">
<table><tr><td><a href="Manage_deadlines.html"><h4 align="left">Previous</h4></a></td></tr></table>

	<%
		int deadid = Integer.parseInt(request.getParameter("deadid"));
		String deadline_name="";
		String submit_date="";
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
			String query = "select * from deadline_details where deadid="+deadid+"";
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
			deadline_name=rs.getString("deadline_name");
			submit_date=rs.getString("submit_date");
			} 
			else {
	%>
	<script language="javascript">
		alert("Deadline not found!");
		document.location.href = "Edit_deadlines.html";
	</script>
	<%
		//response.sendRedirect("login_page.html");
				stmt.close();
			}

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>
<form action="Update_deadlines.jsp" method="post">
Deadline ID: <input type="text" name="deadid" value=<%=deadid %> ><br><br>
Deadline Name: &nbsp; <input type="text" name="deadline_name" value=<%=deadline_name %>><br><br>
Submit Date: &nbsp;&nbsp;<input type="text" name="submit_date" value=<%=submit_date %>><br><br>
<input type="submit" value="UPDATE">
</form>
<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
</body>
</html>