<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>校园图书捐赠管理系统</title>
		<link type="text/css" rel="stylesheet" href="assets/css/login.css">
		<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	</head>
	<body class="login_bj">
		<br />
		<br />
		<div class="zhuce_body">
			<br />
			<br />
			<br />
			<br />
			<h1 style="text-align: center;font-size: 40px;font-family: '华文行楷';color: floralwhite;">校园图书捐赠管理系统</h1>
			<div class="zhuce_kong login_kuang">
				<div class="zc">
					<div class="bj_bai">
						<h3>登录</h3>
						<span style="color: red">${msg }</span>
						<form action="user_index" method="post">
							<input name="u_account" id="u_account" type="text" class="kuang_txt" placeholder="请输入登录账号">
							<input name="u_pwd" id="u_pwd" type="password" class="kuang_txt" placeholder="请输入登录密码"><br />
							<!-- <a href="#">忘记密码？</a> -->
							<input name="u_role" type="radio" value="0" />管理员&nbsp;
							<input name="u_role" type="radio" value="1" checked="checked" />普通用户
							<br /><br />
							<input name="登录" type="submit" class="btn_zhuce" value="登录" onclick="checkLogin()">
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript">
		function checkLogin() {
			var u_account = $('#u_account').val();
			var u_pwd = $('#u_pwd').val();
			if (u_account == null || u_account == '') {
				alert('请输入账号！');
				return false;
			} else if (u_pwd == null || u_pwd == '') {
				alert('请输入密码');
				return false;
			}
		}
	</script>
</html>