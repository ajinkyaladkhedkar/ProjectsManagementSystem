<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LoginRedirectLogic</title>
</head>

<body>
 
	<%
		String uid = request.getParameter("loginid");
		String pass = request.getParameter("password");
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
			String query = "select username,password from login where username='"
					+ uid + "' and password='" + pass + "'";

			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				response.sendRedirect("Home_page.jsp");

			} else {
	%>
	<script language="javascript">
		alert("Invalid login");
		document.location.href = "login_page.html";
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

</body>
</html>