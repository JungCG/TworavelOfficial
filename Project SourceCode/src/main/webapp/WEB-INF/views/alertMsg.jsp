<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림창</title>
</head>
<body>
${er}
<br>
${er2 }
	<script>
		alert('${msg}');
		location.href='<c:out value="${pageContext.request.contextPath}"/>${url}'
	</script>
</body>
</html>