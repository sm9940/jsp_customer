<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<form class="row g-3" action="update?id=${customer.id}" name="frm" method="post" enctype="multipart/form-data">
	<dl>
	<dt>이름</dt>
	<dd><input type="text" name="name" maxlength="50" value=""></dd>
	</dl>
	<dl>
	<dt>주소</dt>
	<dd><input type="text" name="address" maxlength="50" value="${customer.address}"></dd>
	</dl>
	<dl>
	<dt>전화번호</dt>
	<dd><input type="text" name="phone" maxlength="50" value="${customer.phone}"></dd>
	</dl>
	<dl>
	<dt>성별</dt>
	<dd><input type="radio" name="gender" value="남">&nbsp;남</dd>
	<dd><input type="radio" name="gender" value="여">&nbsp;여</dd>
	</dl>
	<dl>
	<dt>나이</dt>
	<dd><input type="text" name="age" maxlength="50" value="${customer.age}"></dd>
	</dl>
	<div class="mb-3">
  <input class="form-control" name="file" type="file" id="file">
  <br>
	<c:if test="${customer.img != null}">
	<img alt="업로드 이미지" src="${customer.img}" width="100"/>
	</c:if>
	<input type="hidden" name="origin_file" value="${customer.img}">
</div>
<dl>
	<dt>포인트</dt>
	<dd><input type="text" name="point" maxlength="50" value="${customer.point}"></dd>
	</dl>
	<select name="grade">
	<option  value="silver">silver</option>
	<option value ="gold">gold</option>
	<option value= "vip">vip</option>
	</select>
  <div class="col-12">
    <button class="btn btn-primary" type="button" onclick="chkForm();">등록</button>
    <a class="btn btn-secondary" href="index">취소</a>
  </div>
</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>