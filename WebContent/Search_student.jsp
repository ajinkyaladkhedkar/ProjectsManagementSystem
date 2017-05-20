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
<table><tr><td><a href="Search_student.html"><h4 align="left">Previous</h4></a></td></tr></table>
<h1>Edit Student Details</h1><br>
	<%
		String sacstateid = request.getParameter("sacstateid");
		String fname="";
		String lname="";
		String sid="";
		String email="";
		String cellnum="";
		int groupid=0;
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
			sid=rs.getString("sid");
			email=rs.getString("email");
			cellnum=rs.getString("cellnum");	
			groupid=rs.getInt("group_id");
			} 
			else {
	%>
	<script language="javascript">
		alert("Student Record Not Found!");
		document.location.href = "Search_student.html";
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
<form action="Update_Student.jsp" method="post">
Sac State ID: <input type="text" name="sacstateid" value=<%=sid %> ><br><br>
First Name: &nbsp; <input type="text" name="firstname" value=<%=fname %>><br><br>
Last Name: &nbsp;&nbsp;<input type="text" name="lastname" value=<%=lname %>><br><br>
Email ID: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" value=<%=email %>><br><br>
Cell Phone: &nbsp;<input type="text" name="cellnum" value=<%=cellnum %>><br><br>
Group ID: &nbsp; <input type="text" name="groupid" value=<%=groupid %>><br><br>
<input type="submit" value="UPDATE">
</form>
<br><br><br><br><br><br><table align="right"><tr><td><a href="Home_page.jsp"><h4 align="left">Go to Home Page</h4></a></td></tr></table>
</body>
</html>