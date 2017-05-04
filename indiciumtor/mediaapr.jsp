<%@page import="indicium.jdbcdao.JdbcConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
        String myname =  (String)session.getAttribute("uname");
        String type =  (String)session.getAttribute("utype");
		String branch =  (String)session.getAttribute("branch");
       
       
        if(myname == null || type == null || !type.equalsIgnoreCase("admin"))
            {
             response.sendRedirect("kill.jsp");
            }
	
	
			
      
%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Control Panel - Admin</title>

<!-- Bootstrap Core CSS -->
<link href="mainresource/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="mainresource/css/modern-business.css" rel="stylesheet">
<link href="mainresource/css/tblcss.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="mainresource/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">



</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="controlpanel.jsp">Indicium Tor</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="aboutuscp.html">About</a></li>
			
				<li><a href="kill.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Control Panel</h1>
				<ol class="breadcrumb">
					<li><a href="controlpanel.jsp">Home</a></li>
					<li class="active">Control Panel</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-md-3">
				<div class="list-group">
					<a href="controlpanel.jsp" class="list-group-item">Home</a>
                    <a href="mediacp.jsp" class="list-group-item">Media Control ( E-Books )</a>
                    <a href="mediacpmaga.jsp" class="list-group-item">Media Control ( Magazines)</a>
                    <a href="mediacpvid.jsp" class="list-group-item">Media Control ( Videos )</a>
                    <a href="usercp.jsp" class="list-group-item">User Control</a>
                    <a href="contentcp.jsp" class="list-group-item">Content Control</a>
                    <a href="alumnicp.jsp" class="list-group-item">Alumni</a>
                    <a href="deleteduser.jsp" class="list-group-item">Deleted User</a>
                    <a href="deactveuser.jsp" class="list-group-item">Deactivate User</a>
						
						<br>
					<br> <br>
				</div>
			</div>
			<!-- Content Column -->
			<div class="col-md-9">
			<form action="aprveb" method="post">
				<%
            int sid = Integer.parseInt(request.getParameter("aid"));							
     		String sql="select * from ebooks where id="+sid;
				//request.setAttribute("sid", sid);
   		 	ResultSet rs=JdbcConnect.selectOperation(sql);
            if(rs.next()){
            	
            
            
            %>
				<center>
					<font size="5">E-Books Details</font>
				</center>
				<div class="CSSTableGenerator">
					<table>
						<tr>
							<td></td>

							<td></td>
						</tr>
						<tr>
							<td>Book Name</td>

							<td><%out.println(rs.getString("bname")); %></td>
						</tr>
						
						<tr>
							<td>Author Name</td>

							<td><%out.println(rs.getString("author")); %></td>
						</tr>
						
						<tr>
							<td>See Book</td>

							<td><a href="pdfreader.jsp?sub=<%=sid %> " target="_blank" >Show Book</a></td>
						</tr>
						
						<tr>
							<td>Approve Status<input type="hidden" name="sid" value="<%= sid %>" /></td>
							
							<td><input type="radio" name="apr" value="yes" checked="checked"/> YES &nbsp;&nbsp;&nbsp; <input type="radio" name="apr" value="no" /> NO </td>
						</tr>
						
						<tr>
							<td colspan="2" align="center"><br><br><button style="margin-left: 390px" type="submit" class="btn">Submit</button><br><br></td>

							
						</tr>
						
					</table>



				</div>
					<%} %>
			</form>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Designed &amp; Developed By @TechnoCrats</p>
			</div>
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="mainresource/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="mainresource/js/bootstrap.min.js"></script>

</body>
</html>