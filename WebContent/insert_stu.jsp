<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보</title>
<style>
		 *{
 		 box-sizing: border-box;
  		 margin: 0;
 	     } 
 	     h2{
 	     margin-bottom: 10px;
 	     }
   		 table{
  		 border: 1px solid black;
  		 }
   		 div{
		 display: flex;
	     justify-content: center;
   		 }
         section{
         margin: 0;
         padding: 0;
         position: absolute;
         top: 200px;
         left: 30%;
         }
         section{
         position: absolute;
         left: 35%;
         }
      	 td {
      	 text-align: center;
      	 border: 1px solid black;     	 
      	 }
      	 
      	 </style>
</head>
	<%@include file = "header.jsp" %>
	<%@include file = "nav.jsp" %>
	<%@include file = "footer.jsp" %>
	<%  
ResultSet rs = null;  
Connection conn = null;  
PreparedStatement pstmt = null;  

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

String sql = "select * from score_tbl";
   
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
	
rs.next();
%>
<body>
      <h2 align="center">학생정보</h2>
      <div>
<table>

      <tr>
         <td>학번</td>
         <td>국어</td>
         <td>영어</td>
         <td>수학</td>
         <td>역사</td>
      </tr>
      <tr>      	
        
		<td><%=rs.getString(1)%></td>
         <td><%=rs.getString(2)%></td>
         <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
      </tr>
      
      <%
         while (rs.next()) {
      %>
      <tr>
      	
         <td><%=rs.getString(1)%></td>
         <td><%=rs.getString(2)%></td>
         <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(4)%></td>
         <td><%=rs.getString(5)%></td>
      </tr>
      <%
         }
      %>
   </table>
   </div>
</body>
</html>