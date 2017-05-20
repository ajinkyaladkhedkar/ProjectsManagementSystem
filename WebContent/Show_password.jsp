a<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show_password</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">

	<%
		String username1 = request.getParameter("username");
		String password1 = request.getParameter("password");
		//String sacstateid1 = request.getParameter("sacstateid");
		//String email1 = request.getParameter("email");
		//String cell1 = request.getParameter("cellnum");
		//int groupid = Integer.parseInt(request.getParameter("groupid"));	
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
	
			String query = "select password from login where username='" + username1 + "'";
					

			stmt.executeUpdate(query);
		
	%>
	<script language="javascript">
		document.location.href = "login_page.html";
	</script>
	<%
		stmt.close();

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>