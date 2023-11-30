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
						<div class="page-header"><h1>个人信息-信息修改</h1></div>
						<div class="row">
							<div class="col-xs-12">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 角色 </label>
										<div class="col-sm-9">
											<input type="hidden" id="u_id" value="${userinfo.u_id }" />
											<input type="text" id="u_role" name="u_role" value="${userinfo.u_role == 1 ? '普通用户' : '管理员' }" readonly="readonly" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 用户名 </label>
										<div class="col-sm-9">
											<input type="text" id="u_name" name="u_name" value="${userinfo.u_name }" placeholder="请填写用户名" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 性别 </label>
										<div class="col-sm-9">
											<input type="radio" name="u_sex" value="男" ${userinfo.u_sex eq "男" ? "checked" : "" } />男&nbsp;&nbsp;
											<input type="radio" name="u_sex" value="女" ${userinfo.u_sex eq "女" ? "checked" : "" } />女
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 手机号 </label>
										<div class="col-sm-9">
											<input type="text" id="u_phone" name="u_phone" placeholder="请输入手机号" value="${userinfo.u_phone }" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 邮箱 </label>
										<div class="col-sm-9">
											<input type="text" id="u_email" name="u_email" placeholder="请输入手机号" value="${userinfo.u_email }" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button" id="btn_submit" onclick="editUserInfo()">
												<i class="ace-icon fa fa-check bigger-110"></i>
												保存修改
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
			function editUserInfo() {
				var u_id = $('#u_id').val();
				var u_name = $('#u_name').val();
				var u_sex = $('input[name="u_sex"]:checked').val();
				var u_phone = $('#u_phone').val();
				var u_email = $('#u_email').val();
				
				if (u_name == null || u_name == '') {
					alert('用户名不能为空');
					return false;
				}
				
				if (u_sex == null || u_sex == '') {
					alert('请选择性别');
					return false;
				}
				
				if (u_phone == null || u_phone == '') {
					alert('手机号不能为空');
					return false;
				}
				
				$.ajax({
					type : "post",
					url : "editUserInfo",
					data : {"u_id":u_id,"u_name":u_name,"u_sex":u_sex,"u_phone":u_phone,"u_email":u_email},
					dataType : 'json',
					success : function(data){ 
						if (data.msg == 'success') {
							alert("个人信息修改成功！您可以在‘首页-个人信息-信息查看’中查看详情");
							window.parent.location.reload(); // 刷新整个父页面，清除父页面的缓存.
						} else {
							alert("个人信息修改失败");
						}
					},
					error : function() {
						alert('个人信息修改失败~');
					}
				});
			}
		</script>
	</body>
</html>