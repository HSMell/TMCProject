<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>TMC ����������</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<!-- xe������ -->
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<!-- ��Ʈ  -->

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="/logout";
	});
});
</script>
</head>
<body>

			<header class="navbar   head_wrap  ">

					<div class="container px-0 pt-xl-2">
						<div>
						<a href="notice_list.html"  class="btn svg  p-0" alt="�ΰ�"><object  class="d-block logo" type="image/svg+xml" data="img/logo.svg"></object></a>
						</div>
						
						<div><a href="/mypage"   class="   topmenu_ico"> <i class="xi-profile-o xi-2x xi-x"></i> <span class="d-none d-lg-inline-block d-xl-inline-block">${user_id}</a><!-- ���������� -->
						 <a href="#" class="topmenu_ico t_underline" id="logoutBtn">Log out</a>
						</div>
					</div>
					<div class="container sub_tit01">Inspiration for the future society, <br>
creating a new future</div>
				</header>
 

<!-- �������� ����   -->
<div class="container-lg mt-0  mt-md-5  con_wrap">


���볻��



</div>


<!-- �������� ��  -->

 
<!-- �ϴ� -->
 
</body>
<div class="footer">
	��ȣ�� : TMC | ��ǥ�� : ȫ�浿 | ����ڹ�ȣ :123-123-12324 | ����� ���α� �����ȷ�11 | ��ǥ��ȭ : 01-123-4546<br>
COPYRIGHT (C) 2021 TMC. ALL RIGHTS RESERVED
</div>
</html>