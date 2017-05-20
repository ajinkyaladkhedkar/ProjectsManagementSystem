<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update_Deadlines</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">

	<%
		int deadid = Integer.parseInt(request.getParameter("deadid"));
		String deadline_name = request.getParameter("deadline_name");
		String submit_date = request.getParameter("submit_date");
			
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
	
			String query = "update deadline_details set deadline_name='" + deadline_name
					+ "',submit_date=to_date('" + submit_date + "','yyyy/mm/dd') where deadid="+ deadid
					+ "";

			stmt.executeUpdate(query);
		
	%>
	<script language="javascript">
		alert("Deadline Updated Successfully!");
		document.location.href = "Edit_deadlines.html";
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