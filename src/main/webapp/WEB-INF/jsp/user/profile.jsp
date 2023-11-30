<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>校园图书捐赠管理系统</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/components/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
	</head>
	<body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="page-header"><h1>图书捐赠信息</h1></div>
						<div class="row">
							<div class="col-xs-12">
								<div class="hr dotted"></div>
								<div>
									<div id="user-profile-1" class="user-profile row">
										<div class="col-xs-12 col-sm-3 center">
											<div>
												<span class="profile-picture">
													<img id="avatar" width="100px" height="100px" class="editable img-responsive" alt="用户头像" src="${pageContext.request.contextPath}/assets/avatars/avatar2.png" />
												</span>
											</div>
											<div class="space-6"></div>
											<div class="profile-contact-info">
												<div class="profile-contact-links align-left">
													每成功捐赠一本图书，您的积分将 +1，积分达到一定数值后，可在校图书馆借阅更多图书
												</div>
												<div class="space-6"></div>
											</div>
											<div class="hr hr12 dotted"></div>
											<div class="clearfix">
												<div class="grid">
													<span class="bigger-175 red">${check_3 == null ? 0 : check_3 }</span>
													<br /> 我的积分
												</div>
											</div>
											<div class="hr hr16 dotted"></div>
											
										</div>
										<div class="col-xs-12 col-sm-9">
											<div class="space-12"></div>
											<div class="space-12"></div>
											<div class="center">
												<span class="btn btn-app btn-sm btn-light no-hover">
													<span class="line-height-1 bigger-170 blue"> ${check_0 == null ? 0 : check_0 } </span>
													<br />
													<span class="line-height-1 smaller-90"> 待审核图书 </span>
												</span>
												<span class="btn btn-app btn-sm btn-success no-hover">
													<span class="line-height-1 bigger-170"> ${check_1 == null ? 0 : check_1 } </span>
													<br />
													<span class="line-height-1 smaller-90"> 已通过 </span>
												</span>
												<span class="btn btn-app btn-sm btn-blue no-hover">
													<span class="line-height-1 bigger-170"> ${check_3 == null ? 0 : check_3 } </span>
													<br />
													<span class="line-height-1 smaller-90"> 已捐赠 </span>
												</span>
												<span class="btn btn-app btn-sm btn-pink no-hover">
													<span class="line-height-1 bigger-170"> ${check_2 == null ? 0 : check_2 } </span>
													<br />
													<span class="line-height-1 smaller-90"> 未通过 </span>
												</span>
											</div>
											<div class="hr hr2 hr-double"></div>
											<div class="space-12"></div>
											<div class="space-12"></div>
											<div style="font-size: 18px">
												<i class="ace-icon fa fa-plus-circle bigger-120 green"></i>
												最近一次审核通过的图书
												<div class="hr hr2 hr-double"></div>
											</div>
											<div class="profile-user-info profile-user-info-striped">
												<c:choose>
													<c:when test="${not empty book }">
														<div class="profile-info-row">
															<div class="profile-info-name"> 书名 </div>
															<div class="profile-info-value">
																<span class="editable" id="b_name">《 ${book.b_name } 》</span>
															</div>
														</div>
														<div class="profile-info-row">
															<div class="profile-info-name"> 作者 </div>
															<div class="profile-info-value">
																<span class="editable" id="b_author"> ${book.b_author }</span>
															</div>
														</div>
														<div class="profile-info-row">
															<div class="profile-info-name"> 出版社 </div>
															<div class="profile-info-value">
																<span class="editable" id="age">${book.b_publish }</span>
															</div>
														</div>
														<div class="profile-info-row">
															<div class="profile-info-name"> 出版日期 </div>
															<div class="profile-info-value">
																<span class="editable" id="signup">${book.b_pdate }</span>
															</div>
														</div>
														<div class="profile-info-row">
															<div class="profile-info-name"> 审核通过日期 </div>
															<div class="profile-info-value">
																<span class="editable" id="login">${book.b_checkdate }</span>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<h1>您还没有审核通过的图书~</h1>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="hr hr2 hr-double"></div>
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