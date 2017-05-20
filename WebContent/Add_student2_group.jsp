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
		String sacstateid = request.getParameter("sacstateid");
		int group_id = Integer.parseInt(request.getParameter("group_id"));
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
	System.out.println(sacstateid);
	System.out.println(group_id);
		//step4 execute query 
		String query = "update student_details set group_id ="+group_id+" where sid='"+sacstateid+"'";
	     stmt.executeUpdate(query);
	%>
	<script language="javascript">
		alert("Student added successfully");
		document.location.href = "Add_student2_group.html";
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

