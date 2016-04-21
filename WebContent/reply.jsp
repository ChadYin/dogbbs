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

					<table>


						<tr>
							<th>帖子名:${topic.t_name }</th>
							<th align="left">楼主:${u_name }</th>
							<th align="right">发帖时间:${topic.t_time }</th>
							<c:if test="${sessionScope.userinfo.u_identity==1 }">
								<td><a
									href="forbid?user.u_id=${sessionScope.userinfo.u_id }">封禁</a></td>
							</c:if>

						</tr>
						<tr>
							<td>帖子内容:${topic.t_content }</td>
						</tr>
					</table>

					<table>
						<c:forEach items="${replylists }" var="rl">
							<tr>
								<th>回帖人:${rl.u_name }</th>
								<th>回帖时间:${rl.r_time }</th>
								<c:if test="${sessionScope.userinfo.u_identity==1 }">
									<td><a
										href="deletereply.action?reply.r_id=${rl.r_id }&topic.t_id=${topic.t_id}&topic.t_name=${topic.t_name }&topic.t_time=${topic.t_time}&topic.t_content=${topic.t_content}&u_name=${u_name}">删除回复</a>||<a
										href="forbid?user.u_id=${rl.u_id }">封禁</a></td>
								</c:if>
							</tr>
							<tr>
								<td>${rl.r_content }</td>
							</tr>
						</c:forEach>
						<tr>
							<td><c:if test="${page!=1 }">
									<a
										href="topiclist.action?page=${page-1 }&t_id=${topic.t_name }">上一页</a>
								</c:if></td>
							<td><c:if test="${page!=pages }">
									<a href="topiclist.action?page=${page+1}&t_id=${topic.t_name }">下一页</a>
								</c:if></td>
						</tr>
					</table>
				</div>
			</div>
			</section>
			<form action="addreply" method="post">
				<div style="margin-left: 238px">
					<h4>回帖</h4>

					<c:if test="${sessionScope.userinfo.u_state==0 }">


						<div class="form">
							<span style="float: left; font-weight: bolder;">内容</span>
							<div style="float: right; margin-right: 220px;">
								最多输入140个字符，您还可以输入 <span id="textCount">140</span> 个字符<br />
							</div>
							<p>
								<textarea name="reply.r_content" id="TextArea1" rows="10"
									cols="30" style="width: 700px;"> </textarea>
								<input type="hidden" name="reply.r_u_id"
									value="${sessionScope.userinfo.u_id }"> <input
									type="hidden" name="reply.r_t_id" value="${topic.t_id}">
								<input type="hidden" name="topic.t_name"
									value="${topic.t_name }"> <input type="hidden"
									name="topic.t_id" value="${topic.t_id }"> <input
									type="hidden" name="topic.t_time" value="${topic.t_time }">
								<input type="hidden" name="topic.t_content"
									value="${topic.t_content }"> <input type="hidden"
									name="u_name" value="${u_name }">
							</p>

						</div>
						<div style="margin-left: 450px">
							<input type="submit" class="button" value="回复" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="button" value="重置" />
						</div>
					</c:if>
					<c:if test="${sessionScope.userinfo.u_state==1 }">
					您被发言不当被封禁，无法回复，请等待管理员解封
					</c:if>
				</div>
			</form>
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