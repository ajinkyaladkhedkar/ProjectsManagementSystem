<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Student Record</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">

	<%
		String sacstateid1 = request.getParameter("sacstateid");

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
		
			System.out.println(sacstateid1);
			//step4 execute query 
			String query = "delete from student_details where sid='" + sacstateid1+ "'";
			stmt.executeUpdate(query);
		
	%>
	<script language="javascript">
		alert("Student Record Delete Successfully!");
		document.location.href = "Delete_student_details.html";
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