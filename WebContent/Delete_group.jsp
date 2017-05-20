<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete_student</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">
<table><tr><td><a href="Delete_group.html"><h4 align="left">Previous</h4></a></td></tr></table>
<h1>Delete Group Details</h1><br><br>
	<%
		int group_id = Integer.parseInt(request.getParameter("group_id"));
		String project_name="";
		
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
			String query = "select * from group_details where group_id='"
					+ group_id + "'";

			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
			group_id=rs.getInt("group_id");
			project_name=rs.getString("project_name");
				
			} 
			else {
	%>
	<script language="javascript">
		alert("Group Record Not Found!");
		document.location.href = "Delete_group.html";
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
<form action="Delete_group_logic.jsp" method="post">
Group Id: <input type="text" name="group_id" value=<%=group_id %> ><br><br>
Project Name: <input type="text" name="project_name" value=<%=project_name %>><br><br>

<input type="submit" value="DELETE">
</form>
<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
</body>
</html>