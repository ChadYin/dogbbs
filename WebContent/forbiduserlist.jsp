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

					<table>
						<tr>
							<td>用户名</td>
							<td>用户邮箱</td>
							<td>真实姓名</td>
							<td>身份证号</td>
							<td>个性签名</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${forbiduserlist }" var="fl">
							<tr>
								<td>${fl.u_name }</td>
								<td>${fl.u_email }</td>
								<td>${fl.u_realname }</td>
								<td>${fl.u_number }</td>
								<td>${fl.u_tips }</td>
								<td><a href="outforbid.action?user.u_id=${fl.u_id }"><input
										type="button" value="解封"></a></td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			</section>



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