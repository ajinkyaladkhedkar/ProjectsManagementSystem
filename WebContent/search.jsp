<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
</head>
<link rel="stylesheet" type="text/css" href="login_prop.css">
<body>
UPDATE STUDENT DETAILS<br><br>
	<%
		String cell = request.getParameter("cellphone");
		String fname="";
		String lname="";
		String uname="";
		String pass="";
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
			String query = "select * from login where cellphone='"
					+ cell + "'";

			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
			fname=rs.getString("firstname");
			lname=rs.getString("lastname");
			uname=rs.getString("username");
			pass=rs.getString("password");
			cell=rs.getString("cellphone");	
			} 
			else {
	%>
	<script language="javascript">
		alert("Student Record Not Found!");
		document.location.href = "search.html";
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
<form action="update_student.jsp" method="post">
Cellphone: <input type="text" name="cellphone" value=<%=cell %> ><br><br>
First Name: <input type="text" name="firstname" value=<%=fname %>><br><br>
Last Name: <input type="text" name="lastname" value=<%=lname %>><br><br>
Username: <input type="text" name="username" value=<%=uname %>><br><br>
Password: <input type="text" name="password" value=<%=pass %>><br><br>
<input type="submit" value="UPDATE">
</form>
</body>
</html>