<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="DoStrategy" method="get" name="form2">
		<input type="radio" name="strategy" value="1" /> 策略1
		<br/>
		<div class="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;策略1说明：当用户数连续三个时间点小于等于20，功率设为16<br/></div>
		<br/>
		<input type="radio" name="strategy" value="2" /> 策略2
		<div class="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;策略2说明：当用户数连续三个时间点小于等于20，功率设为15<br/></div>
		<br/>
		<input type="radio" name="strategy" value="3" /> 策略3
		<div class="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;策略3说明：当用户数连续三个时间点小于等于20，功率设为14<br/></div>
		<br/>
		<input type="radio" name="strategy" value="stop" /> 策略停止
		<div class="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;停止运行策略，改由人工控制<br/></div>
		<input type="submit" class="btn" value="执行">
	</form>
</body>
</html>