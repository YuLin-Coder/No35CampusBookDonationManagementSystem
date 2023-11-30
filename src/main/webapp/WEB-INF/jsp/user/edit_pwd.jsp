<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>校园图书捐赠管理系统</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script src="${pageContext.request.contextPath}/assets/js/ace-extra.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	</head>
	<body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="page-header"><h1>个人信息-密码修改</h1></div>
						<div class="row">
							<div class="col-xs-12">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 原密码 </label>
										<div class="col-sm-9">
											<input type="password" id="old_pwd" name="old_pwd" placeholder="请输入原密码" class="col-xs-10 col-sm-5" />
											<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="warn1"></span>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 新密码 </label>
										<div class="col-sm-9">
											<input type="password" id="u_pwd" name="u_pwd" placeholder="请输入新密码" class="col-xs-10 col-sm-5" />
											<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="warn2"></span>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 确认密码 </label>
										<div class="col-sm-9">
											<input type="password" id="u_repwd" name="u_repwd" placeholder="请再次输入新密码" class="col-xs-10 col-sm-5" />
											<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="warn3"></span>
											</span>
										</div>
									</div>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button" id="btn_submit" onclick="edit_pwd()">
												<i class="ace-icon fa fa-check bigger-110"></i>
												提交信息
											</button> &nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												取消
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function edit_pwd() {
				var old_pwd = $('#old_pwd').val();
				var u_pwd = $('#u_pwd').val();
				var u_repwd = $('#u_repwd').val();
				
				if (old_pwd == null || old_pwd == '') {
					$('#warn1').html('<span style="color:red">原密码不能为空！</span>');
					return false;
				} else {
					$('#warn1').html('');
				}
				
				if (u_pwd == null || u_pwd == '') {
					$('#warn2').html('<span style="color:red">新密码不能为空！</span>');
					return false;
				} else {
					$('#warn2').html('');
				}
				
				if (u_repwd == null || u_repwd == '') {
					$('#warn3').html('<span style="color:red">确认密码不能为空！</span>');
					return false;
				} else if (u_repwd !== u_pwd)  {
					$('#warn3').html('<span style="color:red">确认密码与新密码输入不一致！</span>');
					return false;
				} else {
					$('#warn3').html('');
				}
				
				$.ajax({
					type : "post",
					url : "editPwd",
					data : {"old_pwd":old_pwd,"u_pwd":u_pwd},
					dataType : 'json',
					success : function(data){ 
						if (data.msg == 'success') {
							alert("您已成功修改密码，请用新密码重新登录系统！");
							window.location.href="toLogin";
						} else {
							alert("原密码输入不正确！");
						}
					},
					error : function() {
						alert('密码修改失败！');
					}
				});
			}
		</script>
	</body>
</html>