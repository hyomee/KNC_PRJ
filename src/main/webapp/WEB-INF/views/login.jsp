<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Calltogether Admin</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Bootstrap Table core CSS    -->
    <link href="/resources/css/faceu.css" rel="stylesheet"/>
	<link href="/resources/css/style.css" rel="stylesheet"/>

    <!--   Core JS Files   -->
	<script src="/resources/js/core/jquery.3.2.1.min.js"></script>
	<script src="/resources/js/core/popper.min.js"></script>
	<script src="/resources/js/core/bootstrap.min.js"></script>
</head>
		<script language="javascript" type="text/javascript">
		
			$(document).ready(function(){
				 
			});
		
			/* 로그인 */
			function fnLogin() {
			
				var sUserId = $("#user_id").val();
				var sUserPw = $("#user_pw").val();
				/*
				if(sUserId == '') {
					alert('ID를 입력하세요');
					return;
				}
				
				if(sUserPw == '') {
					alert('비밀번호를 입력하세요');
					return;
				}
				*/
				var params = {};
				params['usrLoginId'] = sUserId;
				params['usrPwd'] = sUserPw;
							
				console.log('params : ', params);
				console.log('params stringfy : ', JSON.stringify(params));
				
				// /user/login 으로 변경 해야 됨
				
				$.ajax({
			        type : "POST",
			        contentType: 'application/json',
			        dataType : "json",
			        url : "/login/loginProcess",
			        data : JSON.stringify(params),
			        success : function(result) {
			            console.log('=== 성공 ',result);
			            location.href = '/main';
			        },
			        error : function(req, status, error) {
			        	console.log('=== 실패 ',status);
				        location.href = '/main';
			        },
			        complete : function(){
			        }
			    });	
			}
			
		</script>
    </head>

<body style="background-color:#eeeeee">
<section>
<div class="wrapper">

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			
				<div class="login-panel panel panel-default" style=";margin-top:100px;min-height:450px;border:none;background:none;box-shadow:none;">
					<div class="panel-body">
					<p>
						<h1 style="color:#222" class="text-center"><b>Call</b>together Admin</h1>
					</p>
					<p>
					<b>Call</b>together 관리자모드입니다.<br />관리자 아이디와 비밀번호를 입력하세요.
					</p>
						<form method="post" action="">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="ID" name="user_id" id="user_id" type="text" autofocus style="height:55px;">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="PASSWORD" name="user_pw" id="user_pw" type="password" value="" style="height:55px;">
								</div>
								<p>
									<label>
										<input name="remember" type="checkbox" value="Remember Me"> <span class="text-muted">Remember ID</span>
									</label>
								</p>
								<a href="#" onclick="fnLogin()" class="btn btn-lg btn-primary btn-block">Login</a>
							</fieldset>
						</form>					
					<p class="text-center pdt20 f14">
					copyright 2020. <b>Call</b>together all rights reserved.
					</p>
					</div>
				</div>
			</div>
		</div><!--row 끝-->
	</div>
</div><!--wrapper-->
</section>
</body>
</html>