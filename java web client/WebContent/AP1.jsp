<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*"%>   
  
<%@ page import="java.util.*"%>   
  
<%@ page import="java.sql.*"%>   

<%@ page  import="com.lzw.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AP1</title>
<style type="text/css">

div#container{width:1000px}
div#header {background-color:#99bbbb;}
div#menu {background-color:#ffff99;height:1000px;width:400px;float:left;}
div#content {background-color:#EEEEEE;height:1000px;width:600px;float:left;}
div#footer {background-color:#99bbbb;clear:both;text-align:center;}
h1 {margin-bottom:0;}
h2 {margin-bottom:0;font-size:20px;}
ul {margin:0;}
li {list-style:none;}
</style>

</head>
<body> 
<%   
	Getinfo getinfo = new Getinfo("test","root","yongfu");
	int power = getinfo.getmsg("select * from AP1_power order by time desc limit 1");
    int user_num = getinfo.getmsg("select * from AP1_user_num order by time desc limit 1");
	int d_traffic = getinfo.getmsg("select * from AP1_d_traffic order by time desc limit 1");
	int u_traffic = getinfo.getmsg("select * from AP1_u_traffic order by time desc limit 1");	    
%>  
<%response.setHeader("refresh", "300"); %>

<div id="container">

<div id="header">
<h1>AP性能管理</h1>
</div>

<div id="menu">
<h2>AP1实时信息</h2>
<table>
		<tr>
			<td>功率</td><td><%=power%></td>
		</tr>
		<tr>
			<td>用户数</td><td><%=user_num%></td>
		</tr>
		<tr>
			<td>上传流量</td><td><%=d_traffic%></td>
		</tr>
		<tr>
			<td>下载流量</td><td><%=u_traffic%></td>
		</tr>
</table>
</div>

<div id="content">
<h2>AP1设置</h2>
<form action="ControlPower" method="get" name="form1">
	<table>
		<tr>
			<td>功率</td>
			<td><input type="text" name="power"></td>
			<td><input type="submit" class="btn" value="确定"></td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>