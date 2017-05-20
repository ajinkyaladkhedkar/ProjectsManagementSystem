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
<table><tr><td><a href="Delete_student_details.html"><h4 align="left">Previous</h4></a></td></tr></table>
<h1>DELETE STUDENT DETAILS</h1><br><br>
	<%
		String sacstateid = request.getParameter("sacstateid");
		String fname="";
		String lname="";
		String email="";
		String cellnum="";
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
			String query = "select * from student_details where sid='"
					+ sacstateid + "'";

			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
			fname=rs.getString("f_name");
			lname=rs.getString("l_name");
			email=rs.getString("email");
			sacstateid=rs.getString("sid");
			cellnum=rs.getString("cellnum");	
			} 
			else {
	%>
	<script language="javascript">
		alert("Student Record Not Found!");
		document.location.href = "Delete_student_details.html";
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
<form action="Delete_logic.jsp" method="post">
Sac State Id: <input type="text" name="sacstateid" value=<%=sacstateid %> ><br><br>
First Name: <input type="text" name="firstname" value=<%=fname %>><br><br>
Last Name: <input type="text" name="lastname" value=<%=lname %>><br><br>
Email ID: <input type="text" name="username" value=<%=email %>><br><br>
Cell number: <input type="text" name="password" value=<%=cellnum %>><br><br>
<input type="submit" value="DELETE">
</form>
<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
</body>
</html>