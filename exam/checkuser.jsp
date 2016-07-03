<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
 <%!
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
	String dbUser = "root";
	String dbPass = "";
%>
<%
String user = request.getParameter("user");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);
	String sqlcheck= "select * from pengman_user where username=?";
	PreparedStatement pstmt = conn.prepareStatement(sqlcheck);
	pstmt.setString(1,user);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		out.println(1);
	}else{
		out.println(0);
	}
	rs.close();

}catch(Exception e){
	System.out.println(e);
}

%>
