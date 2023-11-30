<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>校园图书捐赠管理系统</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/components/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/docs/sunburst.css" />
	</head>
	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="${pageContext.request.contextPath}/admin/main" class="navbar-brand" target="right">
						<small><i class="fa fa-leanpub"></i> 校园图书捐赠管理系统 </small>
					</a>
				</div>
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info"><small>欢迎,</small>${userinfo.u_name }</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>
							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="${pageContext.request.contextPath}/user/showUserInfo" target="right"><i class="ace-icon fa fa-user"></i>个人信息</a>
								</li>
								<li>
									<a href="#" onclick="user_logout()"><i class="ace-icon fa fa-power-off"></i>注销</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main-container ace-save-state" id="main-container">
			<div id="sidebar" class="sidebar responsive ace-save-state">
				<ul class="nav nav-list">
					<li class="nav-top-li active" id="side1">
						<a href="${pageContext.request.contextPath}/admin/main" target="right" onclick="profile()">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> 管理员：${userinfo.u_name } </span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="nav-top-li" id="side2">
						<a href="#" class="dropdown-toggle" target="right" onclick="userList()">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">用户列表</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 图书审核 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="" id="side5-1">
								<a href="#" onclick="check_0()">
									<i class="menu-icon fa fa-caret-right"></i>
									待审核
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="side5-2">
								<a href="#" onclick="check_1()">
									<i class="menu-icon fa fa-caret-right"></i>
									待捐赠
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="side5-3">
								<a href="#" onclick="check_2()">
									<i class="menu-icon fa fa-caret-right"></i>
									未通过
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li class="nav-top-li" id="side4">
						<a href="#" class="dropdown-toggle" target="right" onclick="donation_history()">
							<i class="menu-icon fa fa-book"></i>
							<span class="menu-text">捐赠记录</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-user"></i>
							<span class="menu-text"> 个人信息 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="" id="side6-1">
								<a href="#" onclick="showUserInfo()">
									<i class="menu-icon fa fa-caret-right"></i>
									信息查看
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="side6-2">
								<a href="#" onclick="toEditUserInfo()">
									<i class="menu-icon fa fa-caret-right"></i>
									信息修改
								</a>
								<b class="arrow"></b>
							</li>
							<li class="" id="side6-3">
								<a href="#" onclick="edit_pwd()">
									<i class="menu-icon fa fa-caret-right"></i>
									密码修改
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
				</ul>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li>
								<a href="#" id="nav-top-1">主页</a>
							</li>
							<!--<li>
								<a href="#" id="nav-top-2"></a>
							</li>-->
						</ul>
					</div>
					<div class="">
						<a href="" target="right"><iframe class="iframe-box" src="about:blank" name="right" scrolling="auto"  frameborder="0" width="100%" height="500px"></iframe></a>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">从戎源码网</span>
							校园图书捐赠管理系统 &copy; 2023
						</span>
						&nbsp; &nbsp;
					</div>
				</div>
			</div>
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div>
		
		<script src="${pageContext.request.contextPath}/components/jquery/dist/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/components/bootstrap/dist/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/docs/rainbow.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/src/ace.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/src/ace.basics.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/src/ace.scrolltop.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/src/ace.sidebar.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/src/ace.submenu-hover.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/src/elements.scroller.js"></script>
		
		<script type="text/javascript">
			$(function() {
				
				// 面包屑导航随菜单栏改变.
				$("#sidebar ul li a").click(function() {
					
					//this.parentNode.attr("class", "active");
					$("#nav-top-1").text($(this).text());
					/*$("#sidebar ul .nav-top-li .submenu li a").click(function () {
						$("#nav-top-2").text($(this).text());
					})*/
				})
				
				// 页面最初加载时 iframe链接到user_index.jsp主页中.
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/admin/main");
			});
			
			// 退出系统
			function user_logout() {
				if(confirm("将要退出系统？")) {
					window.location.href = "user_logout";
				}
			}
			
			// 主页
			function profile() {
				$("#sidebar ul li").removeAttr('class');
				$('#side1').attr('class','nav-top-li active');
			}
			
			// 用户列表.
			function userList() {
				$("#sidebar ul li").removeAttr('class');
				$('#side2').attr('class','nav-top-li active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/admin/userList");
			}
			
			function donation_history() {
				$("#sidebar ul li").removeAttr('class');
				$('#side4').attr('class','nav-top-li active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/admin/donation_history");
			}
			
			function showUserInfo() {
				$("#sidebar ul li").removeAttr('class');
				$('#side6-1').attr('class','active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/user/showUserInfo");
			}
			
			function toEditUserInfo() {
				$("#sidebar ul li").removeAttr('class');
				$('#side6-2').attr('class','active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/user/toEditUserInfo");
			}
			
			function edit_pwd() {
				$("#sidebar ul li").removeAttr('class');
				$('#side6-3').attr('class','active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/user/toEditPwd");
			}
			
			// 待审核
			function check_0() {
				$("#sidebar ul li").removeAttr('class');
				$('#side5-1').attr('class','active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/admin/toBookCheck_0");
			}
			
			// 待捐赠
			function check_1() {
				$("#sidebar ul li").removeAttr('class');
				$('#side5-2').attr('class','active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/admin/toBookCheck_1");
			}
			
			// 未通过
			function check_2() {
				$("#sidebar ul li").removeAttr('class');
				$('#side5-3').attr('class','active');
				$(".iframe-box").attr("src", "${pageContext.request.contextPath}/admin/toBookCheck_2");
			}
			
		</script>
	</body>
</html>