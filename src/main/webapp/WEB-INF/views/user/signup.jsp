<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<title>TMC ȸ������</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- xe������ -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- ��Ʈ  -->

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		//�̸��� ��ȿ�� ���
		var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		$("#btn_signIn").on("click", function(){
			//�̸��� �ߺ��˻� Ajax
		var user_id = $("#inputname2").val();
		var data = {"user_id":user_id};
		data = JSON.stringify(data);
		$.ajax({
			url:"checkId",
			type:"POST",
			data:data,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			async:false,
			success:function(data){
				//���̵� �ߺ���
				if(data.isResult == 1){
					alert("�̸����� �ߺ��Ǿ����ϴ�.");
			          $('#inputname2').val("");
			          $('#inputname2').focus();
					return false;
				}
				//�̸��� �Է�X
				if($('#inputname2').val() == ""){
			          alert("�̸����� �Է����� �ʾҽ��ϴ�");
			          $('#inputname2').focus();
			          return false;
			      }
					
					//�̸��� ����
				if(!regex.test($("#inputname2").val())){
					alert("�̸��� ���Ŀ� �°� �Է����ּ���")
					$('#inputname2').val("");
					$('#inputname2').focus();
					return false;
				}
					
					//��й�ȣ �Է�X
				if($('#inputpass2').val() == ""){
				     alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�");
				     $('#inputpass2').focus();
				     return false;
				 }
			},
			error:function(err){
				alert("error");
			}
		});
	});
		
});
</script>

</head>
<body>

<form action="doSignup" method="post" enctype="multipart/form-data">
<!-- �������� ����   -->
<div class="con_wrap100">
  <div class="box_wrap" >
    <div class="   box_topst ">
     
      <p class="mt-2  join_wrap m-auto"> <b>ȸ�������� ���Ͻó���?</b><br>ȸ������ ������ �Է��ϼ���.  </p>
    </div>

    <div class=" join_wrap02 m-auto">
      <div class="form-group mb-1">
	  <p><b class="pup_st">���̵�</b></p>
        <input type="text" class="form-control" id="inputname2" placeholder="�̸����� �Է��ϼ���" name="id" required/>
      </div>
	  <div class="form-group  mt-3">
	  <p><b class="pup_st">�н�����</b></p>
        <input type="password" class="form-control" id="inputpass2" placeholder="�н����带 �Է��ϼ���" name="pass" required/>
      </div>
       
      <div class="mt-5">
	    
        <button class="btn btn-lg btn-pup02 btn-block" id="btn_signIn" type="submit" /><b>���ԿϷ�</b></button>
      </div>
    
     </div>
  </div>

</div>
</form>
<!-- �������� ��  -->


<!-- �ϴ� -->

</body>
</html>