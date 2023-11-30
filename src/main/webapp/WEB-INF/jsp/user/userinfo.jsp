<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>校园图书捐赠管理系统</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/components/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	</head>
	<body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="page-header"><h1>个人信息-信息查看</h1></div>
						<div class="row">
							<div class="col-xs-12">
								<div class="hr dotted"></div>
								<div>
									<div id="user-profile-1" class="user-profile row">
										<div class="col-xs-12 col-sm-3 center">
											<div>
												<div class="space-12"></div>
												<span class="profile-picture">
													<img id="avatar" width="100px" height="100px" class="editable img-responsive" alt="用户头像" src="${pageContext.request.contextPath}/assets/avatars/profile-pic.jpg" />
												</span>
												<div class="width-60 label label-info label-xlg ">
													<div class="inline position-relative">
														<a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
															<i class="ace-icon fa fa-circle light-green"></i> &nbsp;
															<span class="white">${userinfo.u_name }</span>
														</a>
													</div>
												</div>
											</div>
											<div class="space-6"></div>
											<div class="hr hr16 dotted"></div>
										</div>
										<div class="col-xs-12 col-sm-9">
											<div class="space-12"></div>
											<div class="profile-user-info profile-user-info-striped">
												<div class="profile-info-row">
													<div class="profile-info-name"> 角色 </div>
													<div class="profile-info-value">
														<span class="editable" id="about">${userinfo.u_role == 1 ? "普通用户" : "管理员" }</span>
													</div>
												</div>
												<div class="profile-info-row">
													<div class="profile-info-name"> 账号 </div>
													<div class="profile-info-value">
														<span class="editable" id="u_account">${userinfo.u_account }</span>
													</div>
												</div>
												<div class="profile-info-row">
													<div class="profile-info-name"> 姓名 </div>
													<div class="profile-info-value">
														<span class="editable" id="u_name">${userinfo.u_name }</span>
													</div>
												</div>
												<div class="profile-info-row">
													<div class="profile-info-name"> 性别 </div>
													<div class="profile-info-value">
														<span class="editable" id="u_sex">${userinfo.u_sex }</span>
													</div>
												</div>
												<div class="profile-info-row">
													<div class="profile-info-name"> 手机号 </div>
													<div class="profile-info-value">
														<span class="editable" id="u_phone">${userinfo.u_phone }</span>
													</div>
												</div>
												<div class="profile-info-row">
													<div class="profile-info-name"> 邮箱 </div>
													<div class="profile-info-value">
														<span class="editable" id="u_email">${userinfo.u_email }</span>
													</div>
												</div>
											</div>
											<!-- /section:pages/profile.info -->
											<div class="space-20"></div>
											<div class="hr hr2 hr-double"></div>
											<div class="space-6"></div>
											<div class="center">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>