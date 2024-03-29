<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "./css/style.css"/>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
         crossorigin="anonymous"
      />
</head>
<body>
<header>
<h1 style ="font-weight: bold">고객 정보 리스트</h1>			
</header>
 <div class = "wrap">	
		<table class = "customer_list">
			 
			<thead>
				<tr>
					<th>ID</th>
					<th>고객 이름</th>
					<th>성별</th>
					<th>포인트</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody>
			<!--for(customer customer : customerList)  -->
			<c:forEach var="customer" items="${customerList}" >
				<tr>
					<td>${customer.id}</td>
					<td class="name"><a href="./view?id=${customer.id}">${customer.name}</a></td>
					<td>${customer.gender}</td>
					<td>${customer.point}</td>
					<td>${customer.grade}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class = "bt_wrap bt_list">
			<a href ="regist" class="on">등록</a>
		</div>
		<div class = "customer_page">
			<a href= "#" class = "bt first">&lt;&lt;</a>
			<a href= "#" class = "bt prev">&lt;</a>
			<a href= "#" class = "num on">1</a>
			<a href= "#" class = "num">2</a>
			<a href= "#" class = "num">3</a>
			<a href= "#" class = "num">4</a>
			<a href= "#" class = "num">5</a>
			<a href= "#" class = "bt next">&gt;</a>
			<a href= "#" class = "bt last">&gt;&gt;</a>
		</div>
	</div>
	<footer>
         <p>&copy; 2024 Movie &amp; TV Program. All rights reserved.</p>
         <p>Contact us at: info@example.com</p>
         <div>
            Follow us on:
            <a href="https://twitter.com/example" target="_blank">Twitter</a>
            |
            <a href="https://facebook.com/example" target="_blank">Facebook</a>
         </div>
      </footer>
	<script>
		//request 객체에 error가 있을 경우 에러메세지 출력
		//쿼리스트링에 error가 있을 경우 에러메세지 출력(request 객체에 포함되므로)
		<c:if test="${error != null}">
		alert("${error}");
		</c:if>
		//쿼리스트링에 error가 있을 경우 에러메세지 출력
		<c:if test="${param.error != null}">
		alert("${param.error}");
		</c:if>
	</script>
	
</body>
</html>