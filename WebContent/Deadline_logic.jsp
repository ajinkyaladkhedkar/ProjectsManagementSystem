<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deadline_logic</title>
</head>
<body>
<%
		String deadid = request.getParameter("did");
		String deadline_name = request.getParameter("dname");
		String submit_date = request.getParameter("ddate");
	
		
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
			String query = "insert into deadline_details values('"+ deadid +"','"+deadline_name+"',to_date('"+submit_date+"','mm/dd/yyyy'))";
		     stmt.executeUpdate(query);
	%>
	<script language="javascript">
		alert("Deadline Created Successfully");
		document.location.href = "Add_deadlines.html";
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