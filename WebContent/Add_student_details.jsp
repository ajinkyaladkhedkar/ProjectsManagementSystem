<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddingStudentsDetailsLogic</title>
</head>
<body>
	<%
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String sid = request.getParameter("sacstateid");
		String emailid = request.getParameter("emailid");
		String cellnum = request.getParameter("cellnum");
	
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
		String query = "insert into student_details values('"+firstname+"','"+lastname+"','"+sid+"','"+emailid+"','"+cellnum+"',null)";
	     stmt.executeUpdate(query);
	%>
	<script language="javascript">
		alert("Record inserted successfully");
		document.location.href = "Add_student_details.html";
	</script>
	<%
		//response.sendRedirect("Add_student_details.html");
				stmt.close();

			//step5 close the connection object 
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>
