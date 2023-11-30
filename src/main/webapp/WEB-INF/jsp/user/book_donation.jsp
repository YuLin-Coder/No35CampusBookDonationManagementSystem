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
						<div class="page-header"><h1>捐赠图书-信息填写</h1></div>
						<div class="row">
							<div class="col-xs-12">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 书名 </label>
										<div class="col-sm-9">
											<input type="text" id="b_name" name="b_name" placeholder="请填写要捐赠的图书名称" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 作者 </label>
										<div class="col-sm-9">
											<input type="text" id="b_author" name="b_author" placeholder="请填写图书的作者" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 出版社 </label>
										<div class="col-sm-9">
											<input type="text" id="b_publish" name="b_publish" placeholder="请填写图书的出版社" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 出版日期 </label>
										<div class="col-sm-9">
											<input type="date" id="b_pdate" name="b_pdate" placeholder="请填写图书的出版日期" class="col-xs-10 col-sm-5" />
										</div>
									</div>
									<!-- <div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Password Field </label>
										<div class="col-sm-9">
											<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" />
											<span class="help-inline col-xs-12 col-sm-7">
												<span class="middle">Inline help text</span>
											</span>
										</div>
									</div> -->
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button" id="btn_submit" onclick="book_donation()">
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
			function book_donation() {
				var b_name = $('#b_name').val();
				var b_author = $('#b_author').val();
				var b_publish = $('#b_publish').val();
				var b_pdate = $('#b_pdate').val();
				
				if (b_name == null || b_name == '') {
					alert('请填写图书名称');
					return false;
				}
				
				if (b_author == null || b_author == '') {
					alert('请填写图书作者');
					return false;
				}
				
				if (b_publish == null || b_publish == '') {
					alert('请填写出版社名称');
					return false;
				}
				
				if (b_pdate == null || b_pdate == '') {
					alert('请选择出版日期');
					return false;
				}
				
				$.ajax({
					type : "post",
					url : "donation_submit",
					data : {"b_name":b_name,"b_author":b_author,"b_publish":b_publish,"b_pdate":b_pdate},
					dataType : 'json',
					success : function(data){ 
						if (data.msg == 'success') {
							alert("添加图书信息成功！您可以在‘首页-图书审核’中查看详情");
							window.location.href="main";
						} else {
							alert("添加失败");
						}
					},
					error : function() {
						alert('添加失败');
					}
				});
			}
		</script>
	</body>
</html>