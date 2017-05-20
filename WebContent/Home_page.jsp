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
<link rel="stylesheet" type="text/css" href="Home_page.css">


<body class="common">


	<table align="right">
		<tr>
			<td><a href="login_page.html"><h5>Logout</h5></a></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<h1>Home Page</h1>

	<table class="home" align="center">
		<tr>
			<td><a href="Student_details.html"><img
					src="images/student_details.jpg" alt="Student_details"
					style="width: 100px; height: 100px"> </a></td>
			<td><a href="Group_details.html"><img
					src="images/group_details.jpg" alt="Group_details"
					style="width: 100px; height: 100px"> </a></td>
			<td><a href="Track_project_status.html"><img
					src="images/Track_project_status.jpg" alt="Track_project_status"
					style="width: 100px; height: 100px"> </a></td>
			<td><a href="Generate_report.html"><img
					src="images/Generate_report.jpg" alt="Generate_report"
					style="width: 100px; height: 100px"> </a></td>
			<td><a href="Reset_system.html"><img
					src="images/Reset_system.jpg" alt="Reset_system"
					style="width: 100px; height: 100px"> </a></td>
		</tr>
		<tr>
			<th><a href="Student_detail.html">
					<h4>Student Details</h4>
			</a></th>
			<th><a href="Group_details.html">
					<h4>Group Details</h4>
			</a></th>
			<th><a href="Track_project_status.html">
					<h4>Track Project Status</h4>
			</a></th>
			<th><a href="Generate_report.html">
					<h4>Generate Report</h4>
			</a></th>
			<th><a href="Reset_system.html">
					<h4>Reset System</h4>
			</a></th>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<%
		String deadline_name="";

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
			String query = "select * from deadline_details where submit_date BETWEEN (current_date - 10) and (current_date + 10)";
			ResultSet rs=	stmt.executeQuery(query);
			while(rs.next())
			{
			
			%>
				<marquee>The next deadline is :<%=rs.getString("submit_date")%>&nbsp;<%=rs.getString("deadline_name")%> </marquee> 
			<%
			}
		

		stmt.close();

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	
</body>
</html>