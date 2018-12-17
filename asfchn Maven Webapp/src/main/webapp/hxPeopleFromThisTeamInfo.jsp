<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("path", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta name="keywords" content="">
<meta name="description" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min_EDT.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/master.css">
<link rel="stylesheet" type="text/css"
	href="css/plugins/iCheck/custom.css">
<title>${hxTeam.fullname}的会员信息</title>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>${hxTeam.fullname}的会员信息</h5>
					</div>
					<div class="ibox-content">
						<div class="row">
							<form class="form-horizontal">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-3">
											<div class="J_menuItem">
												<div class="widget green-bg p-lg text-center">
													<div class="m-b-md">
														<h1 class="m-xs">${pageInfo.total}</h1>
														<span class="m-xs box-block">会员数量</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-3">
											<a class="J_menuItem" href="showPeopleThisTeamWhohasPay?id=${hxTeam.id}">
												<div class="widget  yellow-bg p-lg text-center  blue-bg p-lg text-center">
													<div class="m-b-md">
														<h1 class="m-xs">${hxPeopleHasFeed}</h1>
														<span class="m-xs box-block">已缴会费会员数量</span>
													</div>
												</div>
											</a>
										</div>
										<div class="col-sm-3">
											<a class="J_menuItem" href="showPeopleThisTeamWhohasNotPay?id=${hxTeam.id}">
												<div class="widget  blue-bg p-lg text-center">
													<div class="m-b-md">
														<h1 class="m-xs">${pageInfo.total-hxPeopleHasFeed }</h1>
														<span class="m-xs box-block">未缴会费会员数量</span>
													</div>
												</div>
											</a>
										</div>
										<div class="col-sm-3">
											<div class="col-md-12">
												<div class="widget lazur-bg">
													<h4>&nbsp</h4>
													<div class="box-block">
														<p>1，飞行执照</p>
														<p>2，飞行器</p>
														<p>&nbsp</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="row m-b-lg m-t-lg">
							<div class="col-sm-4"></div>
							<div class="col-sm-4 text-center">
								<div class="form-group">
									<div class="input-group">
										<input class="form-control" id="Keywords" name="Keywords"
											placeholder="姓名/会员号/城市" type="text" value=""> <span
											class="input-group-btn">
											<button type="submit" class="btn btn-primary">
												<i class="fa fa-search"></i> 搜索
											</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped table-hover" id="ListTB">
								<thead>
									<tr>
										<th>姓名</th>
										<th>会员号</th>
										<th>性别</th>
										<th>注册地</th>
										<th>出生日期</th>
										<th>年龄</th>
										<th>身份证号</th>
										<th>会费状态</th>
										<th>详情</th>
										<!--  <th>操作</th>-->
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pageInfo.list }" var="hxPeople">
										<tr>
											<td>${hxPeople.name}</td>
											<td>${hxPeople.sn}</td>
											<td>${hxPeople.gender}</td>
											<td>${hxPeople.city}</td>
											<td><fmt:formatDate value="${hxPeople.birthday}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td>${hxPeople.age}</td>
											<td>${hxPeople.certnumber}</td>
											     <c:choose>
											<c:when test="${hxPeople.yearfeestatus eq '' }"><td style="color:red;">未交费</td></c:when>
											<c:when test="${hxPeople.yearfeestatus eq null }"><td style="color:red;">未交费</td></c:when>
											<c:when test="${hxPeople.yearfeestatus eq '1' }"><td style="color:red;">未交费</td></c:when>
											<c:when test="${hxPeople.yearfeestatus eq  '2'}"><td style="color:green;">正常</td></c:when>
											
											
											</c:choose>
											<!-- <td><fmt:formatDate value="${hxPeople.eligibledat }"
													pattern="yyyy-MM-dd HH:mm:ss" /></td> -->
											<td><a type="button"
												href="${path}/toUpdateHxPeopleInTeam?id=${hxPeople.id}">详情</a></td>
											<!-- <td><a type="button"
												href="${path}/delHxPeople?id=${hxPeople.id}">删除</a></td> -->
											<td><a href="#"></a></td>
										</tr>
										<!--  <tr>
											<td colspan="6">
												<div class="table-responsive">
													<table class="table table-hover table-bordered">
														<thead>
															<tr>
																<th>曾参加赛事</th>
																<th>赛事名称</th>
																<th>参与时间</th>
																<th>取得名次</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>XXXXX门店</td>
																<td>XXX团购</td>
																<td>2018.1.6</td>
																<td>200</td>
															</tr>
															
															
														</tbody>
													</table>
												</div>
											</td>
										</tr>-->
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<nav class="navbar-right" id="pagination">
									<ul class="pagination no-margins">
										<!--  <li class="active"><a href="${path}/showTeamPeople?pn=1">首页</a></li>
										<c:if test="${pageInfo.hasPreviousPage }">
											<li><a
												href="${path}/showTeamPeople?pn=${pageInfo.pageNum-1}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach items="${pageInfo.navigatepageNums }"
											var="page_Num">
											<c:if test="${page_Num == pageInfo.pageNum }">
												<li class="active"><a href="#">${ page_Num}</a></li>
											</c:if>
											<c:if test="${page_Num != pageInfo.pageNum }">
												<li><a href="${path}/showTeamPeople?pn=${ page_Num}">${ page_Num}</a></li>
											</c:if>
										</c:forEach>
										<c:if test="${pageInfo.hasNextPage }">
											<li><a
												href="${path}/showTeamPeople?pn=${pageInfo.pageNum+1}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
										<li><a href="${path}/showTeamPeople?pn=${pageInfo.pages}">末页</a></li>-->
									</ul>
								</nav>
								<div class="clearfix"></div>
							</div>
							<div class="col-sm-3 text-left">
								<!--  共 <span class="text-danger">${pageInfo.total} </span>条，第 <span
									class="text-danger">${pageInfo.pageNum} </span> 页-->
							</div>
							<div class="col-sm-3 text-right" text-align="center">
								<div class="btn btn-sm btn-white active" id="PageSizeRG">
									<a href="toAddHxPeopleByTeam?id=${hxTeam.id}">增加会员</a>
								</div>
								<!--  <div class="btn btn-sm btn-white active" id="PageSizeRG">
									<a href="toUpload?id=${hxTeam.id }">导入会员</a>
								</div>-->
								
								<!--  <button class="btn btn-primary margin-l-md" type="button"
									id="batch-insert" onclick="importAjax()">导入会员</button>-->
								<!--<div class="btn btn-sm btn-white active" id="PageSizeRG"
									data-toggle="buttons">
									  <a href="addHxPeople.jsp">导出会员</a>-->
								</div>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins/iCheck/icheck.min.js"></script>
	<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script>
		// 显示导入ajax
		
		function importAjax() {
			Zky10Util.createRemoteModal('导入',
					'${path}/importExcelSection', {}, function() {
						var valid = $("#uploadExcelForm").valid();
						if (valid) {
							$.ajaxFileUpload({
								url : '${ctx }/hxPeopleImport', //用于文件上传的服务器端请求地址
								secureuri : false, //一般设置为false
								fileElementId : 'file', //文件上传空间的id属性  
								async : true,//是否是异步
								dataType : 'JSON', //返回值类型 一般设置为json 
								success : function(data) {
									//服务器成功响应处理函数
									data = $.parseJSON(data.replace(/<.*?>/ig,
											""));
									Zky10Util.showAlertMessage($("#message"),
											data.message, "success");
								},
								error : function(data) {
									//服务器响应失败处理函数
									Zky10Util.showAlertMessage($("#message"),
											"导入失败！", "error");

								}
							});
							setTimeout(function() { //使用  setTimeout（）方法设定定时3000毫秒
								window.location.reload();//页面刷新
							}, 3000);
						} else {
							return false;
						}
					}, "导入", "btn-success", "取消", "btn-danger");
		}
		$(document).ready(function() {
			$(".nav-tab-info li a:eq(0)").addClass("active");
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green"
			})
		});
	</script>
</html>