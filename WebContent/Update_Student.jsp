a<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update_Student</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">

	<%
		String fname1 = request.getParameter("firstname");
		String lname1 = request.getParameter("lastname");
		String sacstateid1 = request.getParameter("sacstateid");
		String email1 = request.getParameter("email");
		String cell1 = request.getParameter("cellnum");
		int groupid = Integer.parseInt(request.getParameter("groupid"));	
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
	
			String query = "update student_details set f_name='" + fname1
					+ "',l_name='" + lname1 + "' ,cellnum='" + cell1
					+ "',email='" + email1 + "',group_id="+ groupid +" where sid='" + sacstateid1
					+ "'";

			stmt.executeUpdate(query);
		
	%>
	<script language="javascript">
		alert("Student Record Updated Successfully!");
		document.location.href = "Student_details.html";
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