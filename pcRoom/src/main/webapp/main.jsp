<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here :: dynamic :: accessinfo</title>

<script>

</script>
<style>
	
</style>
</head>
<body>
	<div>
		<span>${accessInfo[0].memName}(${accessInfo[0].nickName})</span><br>
		<span>최근 접속 일시 : ${accessInfo[0].accessTime}</span>
	</div>
	<div>
		<input type="button" id="but" value="로그아웃" onClick="AccessOut('${accessInfo[0].nickName}')"/>
	</div>
		
</body>
</html>