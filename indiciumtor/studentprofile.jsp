<%@page import="java.sql.ResultSet"%>
<%@page import="indicium.jdbcdao.JdbcConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
        String myname =  (String)session.getAttribute("uname");
        String type1 =  (String)session.getAttribute("utype");
		
       
       
        if(myname == null || type1 == null || !type1.equalsIgnoreCase("student"))
            {
             response.sendRedirect("kill.jsp");
            }
	
	
			
      
%>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profile</title>

    <!-- Bootstrap Core CSS -->
    <link href="mainresource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="mainresource/css/modern-business.css" rel="stylesheet">
    <link href="mainresource/css/tblcss.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="mainresource/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="stdhome.jsp">Indicium Tor</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                
                <%
                       String rollmnu=(String)session.getAttribute("uname");
            		   ResultSet rsmnu=JdbcConnect.selectOperation("select * from studentdetails where rollnumber='"+rollmnu+"'");
            		   if(rsmnu.next()){
            			   %><li><a href="studentprofile.jsp"><%out.println(rsmnu.getString("fname")); %></a></li>
                    <%
            		   }
                    %>
                     <li><a href="services.jsp">Tutorial</a></li>
                    <li>
                        <a href="stdpostlist.jsp">Discussion</a>
                    </li>
                    <li>
                        <a href="feedback.jsp">Feedback</a>
                    </li>
                    <li>
                        <a href="stdalumnilist.jsp">Alumni</a>
                    </li>
                    <li>
                        <a href="aboutus1.html">About Us</a>
                    </li>
                    <li>
                        <a href="kill.jsp">Log Out</a>
                    </li>
            </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> <%
                String name="";
                String roll=(String)session.getAttribute("uname");
                 ResultSet rs=JdbcConnect.selectOperation("Select * from studentdetails where rollnumber='"+roll+"'");
            	 if(rs.next())
            	 {
            		 name=rs.getString("fname")+" "+rs.getString("lname");            				 
            	
            	
                
                %>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="stdhome.jsp">Home</a>
                    </li>
                    <li class="active"> Profile</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
         <div class="col-md-9">
			<form action="studenteditprofile.jsp" method="post">
		
				<center>
					<font size="5">Student Details</font><br>
					<font color="red" style="font-size: 1.5em">${upmsg } ${emsg }</font>
				</center>
				<div class="CSSTableGenerator">
					<table>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Photo</td>

							<td valign="middle"><img height="100" width="90" src="imgstudent.jsp?roll=<%= roll %>" >
							
							
							</td>
						</tr>	
						
						
						<tr>
							<td>Login ID</td>

							<td><%out.println(rs.getString("rollnumber")); %></td>
						</tr>
						
						<tr>
							<td>Name</td>

							<td><%out.println(rs.getString("fname")+" "+rs.getString("lname")); %> </td>
						</tr>
						
						<tr>
							<td>Mobile Number</td>

							<td><%out.println(rs.getString("mobileno")); %></td>
						</tr>
						
						<tr>
							<td>E-Mail</td>

							<td><%out.println(rs.getString("email")); %></td>
						</tr>
						
						
						<tr>
							<td>Address</td>

							<td><%out.println(rs.getString("address")); %></td>
						</tr>
						
						<tr>
							<td>Branch</td>

							<td><%out.println(rs.getString("branch")); %></td>
						</tr>
						
						<tr>
							<td>Semester</td>

							<td><%out.println(rs.getString("semester")); %></td>
						</tr>
						
						
						
						
						
						<tr>
							<td colspan="2" align="center"><br><br><p style="margin-left : 30px;" align="center"><font style="font-size: 14px"><a style="text-decoration: none;"href="studenteditprofile.jsp"><img src="resource/img/edit_buttonnew.png"/></a></p><br><br></td>

							
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
            <div align="center" class="row">
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