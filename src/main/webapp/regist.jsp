<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "container">
<form class="row g-3" action="insert" name="frm" method="post" enctype="multipart/form-data">
	<dl>
	<dt>이름</dt>
	<dd><input type="text" name="name" maxlength="50"></dd>
	</dl>
	<dl>
	<dt>주소</dt>
	<dd><input type="text" name="address" maxlength="50"></dd>
	</dl>
	<dl>
	<dt>전화번호</dt>
	<dd><input type="text" name="phone" maxlength="50"></dd>
	</dl>
	<dl>
	<dt>성별</dt>
	<dd><input type="radio" name="gender">&nbsp;남자</dd>
	<dd><input type="radio" name="gender">&nbsp;여자</dd>
	</dl>
	<dl>
	<dt>나이</dt>
	<dd><input type="text" name="age" maxlength="50"></dd>
	</dl>
	<div class="mb-3">
  <input class="form-control" name="file" type="file" id="file">
</div>
<dl>
	<dt>포인트</dt>
	<dd><input type="text" name="point" maxlength="50"></dd>
	</dl>
	<select>
	<option name="grade">silver</option>
	<option name="grade">gold</option>
	<option name="grade">vip</option>
	</select>
  <div class="col-12">
    <a class="btn btn-primary" onclick="chkForm(${customer.id}); return false;">등록</a>
    <a class="btn btn-secondary" href="index">취소</a>
  </div>
</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>