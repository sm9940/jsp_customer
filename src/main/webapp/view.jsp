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
	<div class="customer_wrap">
		<div class="customer_title">
			<a href="index"><strong>고객정보</strong></a>
			<p></p>
		</div>
		<div class="card" style="width: 45rem; height: 850px !important;">
  <c:if test= "${customer.img !=null}">
	<img class="card-img-top" src = "${customer.img}" alt="업로드 이미지" width="350" height="450">
	</c:if>
	
  <div class="card-body">
    <h5 class="card-title">고객 이름: ${customer.name}</h5>
    <p class="card-text">ID:${customer.id} </p>
    <p class="card-text">주소: ${customer.address} </p>
    <p class="card-text">전화번호:  ${customer.phone} </p>
    <p class="card-text">성별:  ${customer.gender} </p>
    <p class="card-text">포인트:  ${customer.point} </p>
    <p class="card-text">등급:  ${customer.grade} </p>
    <button onclick="chkDelete(${customer.id});return false;" class="btn btn-danger">삭제하기</button>
  </div>
</div>
			</div>
			<div class= "bt_wrap">
				<a href="index" class="on">목록</a>
				<a href="edit?id=${customer.id}" class="off">수정</a>
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

		<c:if test= "${error != null}">
		alert("${error}");
		</c:if>
	</script>
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>