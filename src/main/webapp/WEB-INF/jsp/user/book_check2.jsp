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
	</head>
	<body class="no-skin">
		<div class="main-container ace-save-state" id="main-container">
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="page-header">
							<h1>以下图书审核未通过：</h1>
							<br />
							<span style="color: red">很抱歉，您的图书未通过管理员审核~</span>
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
													<th>审核日期</th>
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
																<td>${book.b_checkdate }</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="6"><h1>您还未捐赠过图书！</h1></td>
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
	</body>
</html>