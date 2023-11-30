<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>校园图书捐赠管理系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/components/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	</head>
	<body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="page-header">
							<h1>请您审核以下图书：</h1>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-12">
										<table id="simple-table" class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th>序号</th>
													<th>书名</th>
													<th>作者</th>
													<th>出版社</th>
													<th>出版日期</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty bookList }">
														<c:forEach items="${bookList }" varStatus="index" var="book">
															<tr>
																<td>
																	${index.count }
																	<input type="hidden" name="b_id" value="${book.b_id }" />
																</td>
																<td>《 ${book.b_name } 》</td>
																<td>${book.b_author }</td>
																<td>${book.b_publish }</td>
																<td>${book.b_pdate }</td>
																<td>
																	<div class="hidden-sm hidden-xs btn-group">
																		<button class="btn btn-xs btn-info" title="通过审核" onclick="adminCheck_0Success('${book.b_id}')">
																			<i class="ace-icon fa fa-check bigger-120"></i>通过审核
																		</button>
																		<button class="btn btn-xs btn-danger" title="审核不通过" onclick="adminCheckNo('${book.b_id}')" >
																			<i class="ace-icon fa fa-times bigger-120"></i>审核不通过
																		</button>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="6"><h1>还未有用户的图书捐赠请求信息！</h1></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
								<div class="hr hr-18 dotted hr-double"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			
			// 编辑图书
			function toEditCheck0(b_id) {
				window.location.href="toEditCheck0?b_id=" + b_id;
			}
			
			// 管理员 审核图书-通过审核
			function adminCheck_0Success(b_id) {
				if (confirm('确定要通过该图书的审核吗？')) {
					$.ajax({
						type : "post",
						url : "adminCheck_0Success",
						data : {"b_id":b_id},
						dataType : 'json',
						success : function(data){ 
							if (data.msg == 'success') {
								alert("审核已通过！");
								window.location.href="toBookCheck_0";
							} else {
								alert("审核操作失败!");
							}
						},
						error : function() {
							alert('操作错误！');
						}
					});
				}
			}
			
			// 审核不通过 b_check=2.
			function adminCheckNo(b_id) {
				if (confirm('确定不通过该图书的捐赠请求吗？')) {
					$.ajax({
						type : "post",
						url : "adminCheckNo",
						data : {"b_id":b_id},
						dataType : 'json',
						success : function(data){ 
							if (data.msg == 'success') {
								alert("操作成功！");
								window.location.href="toBookCheck_0";
							} else {
								alert("操作失败!");
							}
						},
						error : function() {
							alert('操作错误！');
						}
					});
				}
			}
		</script>
	</body>
</html>