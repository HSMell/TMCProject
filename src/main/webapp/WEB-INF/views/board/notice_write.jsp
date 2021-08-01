<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">

<title>TMC �Խ��Ǳ۾���</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- xe������ -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<!-- ��Ʈ  -->
<script>
$(document).ready(function(){
	
	$('#btn_cancel').click(function(){
		var result = confirm("�ۼ��� ������ ������� �ʽ��ϴ�.");
		
		if(result) {
			location.replace('/notice_list');
		}
	});	
	
	$("#input_file").on("change", fileCheck);
	$("#btn_add_files").click(function(e){
		e.preventDefault();
        $("#input_file").click();
	});
	
	$('#btn_add').click(function(e){
		e.preventDefault();
		if(!fnValidation()) return false;
		formAction();
	});
});

//���� ���� �ʵ� ���� totalCount�� �񱳰�
let fileCount = 0;
//�ش� ���ڸ� �����Ͽ� ��ü ���ε� ������ ���Ѵ�.
const totalCount = 1;
//���� ���� �ʵ� ũ�� totalSize�� �񱳰�
let fileSize = 0;
//�ش� ���ڸ� �����Ͽ� ��ü ���ε� ũ�⸦ ���Ѵ�.
const totalSize = 10485760;
// ���� �����ѹ�
let fileNum = 0;
// ÷������ �迭
let content_files = new Array();

fileCheck = function(e){
	let files = e.target.files;
    
    // ���� �迭 ���
    let filesArr = Array.prototype.slice.call(files);
 	
    // ���� ���� Ȯ�� �� ����
    if (fileCount + filesArr.length > totalCount) {
		alert("������ �ִ� "+totalCount+"������ ���ε� �� �� �ֽ��ϴ�.");
		return;
    } else {
		fileCount = fileCount + filesArr.length;
    }
    
    // ������ ���� �迭��� �� ��Ÿ
    filesArr.forEach(function (f) {
    	//���� ũ�� Ȯ�� �� ����
    	if (fileSize + f.size > totalSize) {
			$.alert("������ �ִ� 10MB���� ���ε� �� �� �ֽ��ϴ�.");
			return;
	    } else {
	    	fileSize = fileSize + f.size;
	    }
    	
		let reader = new FileReader();
		reader.onload = function (e) {
			content_files.push(f);
			let innerHtml = '<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
				+ '<font style="font-size:12px">' + f.name + '</font>'  
				+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
				+ '<div/>' + '<div id="div_file' + fileNum + '" >'
				+ '<img id="img' + fileNum + '" src="' + e.target.result + '" style="width:150px; height:150px; vertical-align: middle;"/>'
				+ '<div/>';
			
			$("#articlefileChange").append(innerHtml);
			
			/* innerHtml = '<div id="div_file' + fileNum + '" >'
				+ '<img id="img' + fileNum + '" src="' + e.target.result + '" style="width:150px; height:150px; vertical-align: middle;"/>'
				+ '<div/>';
			
			$("#articlePreViewChange").append(innerHtml); */
			
			fileNum ++;
		};
		reader.readAsDataURL(f);
	});
	//console.log(content_files);
	//�ʱ�ȭ �Ѵ�.
	$("#input_file").val("");
};

//���� �κ� ���� �Լ�
fileDelete = function(fileNum){
	//debugger;
	let no = fileNum.replace(/[^0-9]/g, "");
	content_files[no].is_delete = true;
	$("#" + fileNum).remove();
	$("#div_" + fileNum).remove();
	fileCount --;
	fileSize = fileSize - content_files[no].size;
	//console.log(content_files);
};

/*
 * �� submit ����
 */
formAction = function(){
	//debugger;
	let form = $("form")[0];        
	let formData = new FormData(form);
	for (let x = 0; x < content_files.length; x++) {
		// ���� ���Ѱ͸� ��� �ش�. 
		if(!content_files[x].is_delete){
			formData.append("article_file", content_files[x]);
		}
	}
	
	$.ajax({
		type: "POST",
		enctype: "multipart/form-data",
		url: "requestupload",
		data : formData,
		processData: false,
		contentType: false,
		success: function (data) {			
				alert("�ۼ��� ���� ��� �Ͽ����ϴ�.");
				location.href = "/notice_list";			
		},
		error: function (xhr, status, error) {
			alert("���������� �����ǰ��ֽ��ϴ�. ��� �� �ٽ� �õ����ֽñ� �ٶ��ϴ�.");
			return false;
		}
	});
};

//��ȿ��üũ
fnValidation = function(){
	
	if($('#text_title').val() == "") {
		alert("�� ������ �Է��� �ּ���.");
		return false;
	}
	
	else if($('#text_title').val().length > 100){
		alert("������ 100���ڰ� ������ �ȵ˴ϴ�.");
		return false;
	}
	
	if($('#text_content').val() == "") {
		alert("�� ������ �Է��� �ּ���.");
		return false;
	}

	if(content_files.length > 0){
		let not_del_cnt = 0;
		for(let i=0; i < content_files.length; i++){
			if(content_files[i].is_delete == null || content_files[i].is_delete == undefined){
				not_del_cnt++;
			}
		}
		if(not_del_cnt < 1){
			alert("������ ÷�����ּ���.!!");
			return false;
		}
	}
	return true;
};
</script>
</head>
<body>

			<header class="navbar   head_wrap  ">

					<div class="container px-0 pt-xl-2">
						<div>
						<a href="notice_list.html"  class="btn svg  p-0" alt="�ΰ�"><object  class="d-block logo" type="image/svg+xml" data="img/logo.svg"></object></a>
						</div>
						
						<div><a href="https://dmonster1629.cafe24.com/design2/mypage.html"   class="   topmenu_ico"> <i class="xi-profile-o xi-2x xi-x"></i> <span class="d-none d-lg-inline-block d-xl-inline-block">Robert John Downey Jr</a><!-- ���������� -->
						 <a href="#" class="topmenu_ico t_underline">Log out</a>
						</div>
					</div>
					<div class="container sub_tit01">Inspiration for the future society, <br>
creating a new future</div>
				</header>
 

<!-- �������� ����   -->

<div class="container-lg mt-5   ">
	<form name="fileForm" id="fileForm" class="image-upload-wrap">	
	<input type="hidden" id="boardNum" name="boardNum" value="B0000001" />
	<input type="hidden" id="user_id" name="user_id" value="tjdwns7761" />
	<h2>�Խ��� �۾���</h2>
	<div class="board_w">
		<div class="form-group  mt-3">
		  
		 
			<input type="text" class="form-control" name="text_title" id="text_title" placeholder="������ �Է��ϼ���" required/>
		  </div>

		  <div class="form-group  mt-3">
		  
			
    <textarea class="form-control" id="text_content" name="text_content" rows="10"  placeholder="������ �Է��ϼ���" ></textarea>
		  </div>

		  <!-- ÷������ -->
		  <div class="form-group  mt-3">  	
		  <div class="upload-button" id="btn_add_files">
			<p><b class="">÷������</b></p>
			</div>
	        <input id="input_file" multiple="multiple" type="file" name="file" accept="image/*" style="display:none;">
			<span style="font-size:10px; color: gray;"></span> 
			<div id="data_file_txt">		
				<div id="articlefileChange" class="article"></div>	
			</div>		  	
			<input type="text" class="form-control" id="inputname2" placeholder="÷�������� ���ε��Ҽ��ְ� ���ּ���" />
		  </div>

	</div>
	</form>
	<div class="text-center mt-4">       
		<button type="button" class="btn  btn-outline-dark" id="btn_cancel">���</button> 
		<button type="button" class="btn  btn-pup" id="btn_add">�ۼ��Ϸ�</button> 
	</div>

</div>


<!-- �������� ��  -->

 
<!-- �ϴ� -->
 
</body>
<div class="footer">
	��ȣ�� : TMC | ��ǥ�� : ȫ�浿 | ����ڹ�ȣ :123-123-12324 | ����� ���α� �����ȷ�11 | ��ǥ��ȭ : 01-123-4546<br>
COPYRIGHT (C) 2021 TMC. ALL RIGHTS RESERVED
</div>
</html>