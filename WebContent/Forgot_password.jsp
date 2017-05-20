<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot_password</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">
<h1>Forgot Password</h1><br>
	<%
		String username = request.getParameter("username");
		String password="";
	//	String lname="";
		//String sid="";
		//String email="";
		//String cellnum="";
		//int groupid=0;
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
			String query = "select username, password from login where username='"
					+ username + "'";

			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
			username=rs.getString("username");
			password=rs.getString("password");
			//sid=rs.getString("sid");
			//email=rs.getString("email");
			//cellnum=rs.getString("cellnum");	
			//groupid=rs.getInt("group_id");
			} 
			else {
	%>
	<script language="javascript">
		alert("Enter valid username");
		document.location.href = "Forgot_password.html";
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
<form action="Show_password.jsp" method="post">
Username: <input type="text" name="username" value=<%=username %> ><br><br>
Password: <input type="text" name="password" value=<%=password %>><br><br>

<input type="submit" value="Go to Login Page">
</form>
</body>
</html>