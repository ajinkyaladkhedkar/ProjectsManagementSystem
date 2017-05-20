<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update_group</title>
</head>
<link rel="stylesheet" type="text/css" href="Home_page.css">
<body class="center">

	<%
		int group_id1 = Integer.parseInt(request.getParameter("group_id"));
		int dead = Integer.parseInt(request.getParameter("dead"));
	
		Connection con1 = null;
try {
			//step1 load the driver class 
			Class.forName("oracle.jdbc.pool.OracleDataSource");
			//step2 create  the connection object 
			con1 = DriverManager.getConnection(
					"jdbc:oracle:thin:@//127.0.0.1:1521/XE", "system",
					"ajinkya");
		
		//	System.out.println(deadid.length);
	
	
			//step3 create the statement object 
			Statement stmt1 = con1.createStatement();
		
			String query1 = "insert into deadlines_achieved values("+group_id1+","+dead+")";
			stmt1.executeUpdate(query1);
		
			
		
	%>
	<script language="javascript">
		alert("Group Record Updated Successfully!");
		document.location.href = "Search_by_group.html";
	</script>
	<%
	
		stmt1.close();

			//step5 close the connection object 
		
			con1.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>