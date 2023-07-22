<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
  
 <%@page isELIgnored="false" %>
   <%@page import="java.util.List"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="retrieve.jsp" method="post">
<div align="center">
<input type="text" name="Search" class="form-control" 
			   placeholder="Type imageid">
 <button type="submit" value="Search" >Search</button>
 </div>
</form>

    
<%
        if(request.getParameter("Search")==null){%>
        <div class="tab"></div>
       	<table align="center" border="5px"  >
			    <thead class="hd">
			     <tr class="warning">
			     	<th scope="col">Image Id</th>
			   	    <th scope="col">user name</th>
			   	    <th scope="col">password</th>
			   	    <th scope="col">Imagepath</th>
			   		
			    </tr>
			    </thead>
			    
			    <%
			    try {
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/imagetutorial?characterEncoding=utf8","root","srivkp@2003");
		            String sql = "select * from users ";
		    		
		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		
		    		ResultSet rs = ps.executeQuery();
		    		while(rs.next())
		    		{%>
		    			<tr>
		    			<td><%=rs.getInt("id")%></td>
		    			
		    			<td><%=rs.getString("username")%></td>
		    			<td><%=rs.getString("password")%></td>
		    			
		    			<td><img src="image/<%=rs.getString("image_path")%>" style="width:250px;height:250px"></td> 
		    			
			           
		    			 
		    			</tr>
		    			
		    		<%}
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
			  </tbody>
</table>
	
<%}
else{%>
      <div class="col-md-8">
	<table align="center" border="5px" >
	           <thead class="hd">
			     <tr class="warning">
			     <th scope="col">Image Id</th>
			   	    <th scope="col">user name</th>
			   	    <th scope="col">password</th>
			   	    <th scope="col">Imagepath</th>
			   		
			    </tr>
			    </thead>
			    
			    <%
			    try {
			    	String s1 = request.getParameter("Search");
					Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn =DriverManager.getConnection( "jdbc:mysql://localhost:3306/imagetutorial?characterEncoding=utf8","root","srivkp@2003");
		            String sql = "select * from users where (id  like'%"+s1+"%')";
		    		PreparedStatement ps = conn.prepareStatement(sql);
		    		
		    		
		    		ResultSet rs = ps.executeQuery();
		    		while(rs.next())
		    		{%>
		    			<tr>
		    			<td><%=rs.getInt("id")%></td>
		    			
		    			<td><%=rs.getString("username")%></td>
		    			<td><%=rs.getString("password")%></td>
		    			
		    			<td><img src="image/<%=rs.getString("image_path")%>" style="width:250px;height:250px"></td> 
		    			
			           
		    			 
		    			</tr>

		    		<%}
		            
				}
				catch(Exception ae) {
					ae.printStackTrace();
				}
			    %>
			  
</table>
</div>
<%} %>
</body>
</html>