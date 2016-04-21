<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrollzer.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-xlarge.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->

<script type="text/javascript">
	$(document).ready(function() {
		$("#TextArea1").keydown(function() {
			var curLength = $("#TextArea1").val().length;
			if (curLength >= 140) {
				var num = $("#TextArea1").val().substr(0, 139);
				$("#TextArea1").val(num);
				alert("提示：超过字数限制，多出的字将被截断！");
			} else {
				$("#textCount").text(139 - $("#TextArea1").val().length)
			}
		})
		$("#TextArea2").keydown(function() {
			var curLength = $("#TextArea2").val().length;
			if (curLength >= 40) {
				var num = $("#TextArea2").val().substr(0, 39);
				$("#TextArea2").val(num);
				alert("提示：超过字数限制，多出的字将被截断！");
			} else {
				$("#textCount1").text(39 - $("#TextArea2").val().length)
			}
		})
	})
</script>
</head>
<body>
	<div id="wrapper">

		<!-- Header -->
		<section id="header" class="skel-layers-fixed"> <header>
		<span class="image avatar"><img src="images/avatar.jpg" alt="" /></span>
		<h1 id="logo">
			<c:if test="${sessionScope.userinfo.u_id==null }">
				<a href="login.jsp">登录</a>
			</c:if>
			<c:if test="${sessionScope.userinfo.u_id!=0 }">
			${sessionScope.userinfo.u_name }
		</c:if>
		</h1>

		<p>
			欢迎来到 Goin论坛 <br /> 只做宠物狗的论坛
		</p>
		</header> <nav id="nav">
		<ul>
			<li><a href="index.jsp">回到首页</a></li>
		</ul>
		</nav> </section>

		<!-- Main -->
		<div id="main">





			<section id="four">
			<div class="container">
				<div id="topiclist">

					<h2>${s_name }</h2>
					<table>
						<tr>
							<td>帖子名</td>
							<td>发帖人</td>
							<td>发帖时间</td>
							<c:if test="${sessionScope.userinfo.u_identity==1 }">
								<td>操作</td>
							</c:if>
						</tr>
						<c:forEach items="${topiclists }" var="tl">
							<tr>
								<td><a
									href="replylist.action?topic.t_id=${tl.t_id}&topic.t_name=${tl.t_name }&u_name=${tl.u_name }&topic.t_time=${tl.t_time }&topic.t_content=${tl.t_content }">${tl.t_name }</a></td>
								<td>${tl.u_name }</td>
								<td>${tl.t_time }</td>
								<c:if test="${sessionScope.userinfo.u_identity==1 }">
									<td><a
										href="deletetopic.action?s_name=${s_name }&topic.t_id=${tl.t_id}">删帖</a></td>
								</c:if>
							</tr>
						</c:forEach>
						<c:if test="${aa!=11 }">
							<tr>
								<td><c:if test="${page!=1 }">
										<a href="topiclist.action?page=${page-1 }&s_name=${s_name}">上一页</a>
									</c:if></td>
								<td><c:if test="${page!=pages }">
										<a href="topiclist.action?page=${page+1}&s_name=${s_name}">下一页</a>
									</c:if></td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
			</section>
			<c:if test="${aa!=11 }">
				<div style="margin-left: 238px">
					<h2>发表新帖</h2>

					<c:if test="${sessionScope.userinfo.u_state==0 }">
						<form action="addtopic" method="post">
							<div class="form" style="width: 100%;">
								<span style="float: left; font-weight: bolder;">帖子名</span>
								<div style="float: right; margin-right: 220px;">
									最多输入40个字符，您还可以输入 <span id="textCount1">40</span> 个字符<br />
								</div>
								<p>
									<input type="text" name="topic.t_name" id="TextArea2" size="80"
										maxlength="20" style="width: 700px;" />
								</p>

							</div>
							<div class="form">
								<span style="float: left; font-weight: bolder;">内容</span>
								<div style="float: right; margin-right: 220px;">
									最多输入140个字符，您还可以输入 <span id="textCount">140</span> 个字符<br />
								</div>
								<p>
									<textarea name="topic.t_content" id="TextArea1" rows="10"
										cols="30" style="width: 700px;"> </textarea>

								</p>

							</div>
							<div style="margin-left: 450px">

								<input type="hidden" name="s_name" value="${s_name }"> <input
									type="hidden" name="topic.t_s_id" value="${s_id }"> <input
									type="hidden" name="topic.t_u_id"
									value="${sessionScope.userinfo.u_id }"> <input
									type="submit" class="button" value="提交" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" class="button" value="重置" />
							</div>
						</form>
					</c:if>
					<c:if test="${sessionScope.userinfo.u_state==1 }">
									您被发言不当被封禁，无法发帖，请等待管理员解封
				</c:if>
				</div>
			</c:if>
			<!-- Footer -->
			<section id="footer">
			<div class="container">
				<ul class="copyright">
					<li>&copy; jit</li>
					<li>made by yinchao</li>
				</ul>
			</div>
			</section>

		</div>
</body>
</html>