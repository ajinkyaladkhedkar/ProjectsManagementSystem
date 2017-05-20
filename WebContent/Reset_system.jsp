<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset System</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">

	<%

		Connection con1 = null;

		try {
			//step1 load the driver class 
			Class.forName("oracle.jdbc.pool.OracleDataSource");
			//step2 create  the connection object 
			con1 = DriverManager.getConnection(
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE", "system",
					"ajinkya");

			//step3 create the statement object 
			Statement stmt1 = con1.createStatement();
			Statement stmt2 = con1.createStatement();
			Statement stmt3 = con1.createStatement();
			Statement stmt4 = con1.createStatement();
			Statement stmt5 = con1.createStatement();
		
					
			//step4 execute query 
			String query1 = "delete from login";

			String query5 = "delete from group_details";
			
			String query3 = "delete from student_details";
			
			String query4 = "delete from deadline_details";
			
			String query2 = "delete from deadlines_achieved";
			
			stmt1.executeUpdate(query1);
			stmt2.executeUpdate(query2);
			stmt3.executeUpdate(query3);
			stmt4.executeUpdate(query4);
			stmt5.executeUpdate(query5);
	%>
	<script language="javascript">
		alert("System Reset successfully!");
		document.location.href = "login_page.html";
	</script>
	<%
	stmt5.close();
	stmt4.close();
	stmt3.close();
	stmt2.close();
	stmt1.close();

			//step5 close the connection object 
			con1.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>