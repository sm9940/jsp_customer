<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "./css/style.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<h1 style ="font-weight: bold">고객 정보 리스트</h1>			
</header>
<main>
<div class = "container">
<div class ="col-md-6 regist">
<form class="row g-3" action="insert" name="frm" method="post" enctype="multipart/form-data">
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">이름</dt>
	<dd><input class="form-control form-control-lg" aria-label=".form-control-lg-lg" type="text" name="name" maxlength="50"></dd>
	</dl>
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">주소</dt>
	<dd><input class="form-control form-control-lg" aria-label=".form-control-lg"  type="text" name="address" maxlength="50"></dd>
	</dl>
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">전화번호</dt>
	<dd><input class="form-control form-control-lg" aria-label=".form-control-lg" type="text" name="phone" maxlength="50"></dd>
	</dl>
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">성별</dt>
	<dd><input class="form-check-input" type="radio" name="gender" value= "남" checked>&nbsp;남</dd>
	<dd><input class="form-check-input" type="radio" name="gender" value= "여">&nbsp;여</dd>
	</dl>
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">나이</dt>
	<dd><input class="form-control form-control-lg" aria-label=".form-control-lg" type="text" name="age" maxlength="50"></dd>
	</dl>
	<div class="mb-3">
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">사진</dt>
	<dd>
  <input class="form-control form-control-lg" name="file" type="file" id="file">
  <c:if test="${customer.img != null}">
	<img alt="업로드 이미지" src="${customer.img}" width="100"/>
	</c:if>
	</dd>
	</dl>
</div>
<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">포인트</dt>
	<dd><input class="form-control form-control-lg" aria-label=".form-control-lg" type="text" name="point" maxlength="50"></dd>
	</dl>
	<dl>
	<dt style="font-size:1.2rem; margin-bottom:10px;">등급</dt>
	<dd>
	<select class="form-select form-select-lg mb-3" aria-label="Default select example" name="grade">
    <option value="silver" selected>silver</option>
    <option value="gold">gold</option>
    <option value="vip">vip</option>
</select>
	</dd>
	</dl>
  <div class="bt_wrap">
    <a class="on" onclick="chkForm(${customer.id}); return false;">등록</a>
    <a class="off" href="index">취소</a>
  </div>
</form>
</div>
</div>
</main>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>