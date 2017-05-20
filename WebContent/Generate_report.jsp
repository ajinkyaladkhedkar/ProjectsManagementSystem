<%@ page contentType="application/vnd.ms-excel" import="java.sql.*"
          language="java"%>
<html>
<head>
	<%@ page import="java.sql.*"%>
	<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
	<meta http-equiv="Content-Type" content="application/vnd.ms-excel;
          charset=iso-8859-1">
	<title>Generate Report</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">
<h1>Generate Report</h1><br><br>
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
			String query = "select * from student_details";

			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
			fname=rs.getString("f_name");
			lname=rs.getString("l_name");
			email=rs.getString("email");
			sacstateid=rs.getString("sid");
			cellnum=rs.getString("cellnum");	
			} 

		//response.sendRedirect("login_page.html");
				stmt.close();

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</html>