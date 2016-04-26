<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
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
	function _onload() {
		var a = document.getElementById("flag").value;
		if (a == null || a == "") {
			a = 1;
		}
		if (a == 1) {
			a = a + 1;
			window.location.href = "sectionlist.action?flag=" + a;
		} else {
			return false;
		}
	}
</script>
</head>
<body onload="_onload()">
	<input type="hidden" id="flag" value="${flag }">
	<div id="wrapper">

		<!-- Header -->
		<section id="header" class="skel-layers-fixed"> <header>
		<span class="image avatar"><img src="images/avatar.jpg" alt="" /></span>
		<h1 id="logo">
			<c:if test="${sessionScope.userinfo.u_id==null }">
				<a href="login.jsp">登录</a>/
				<a href="regist.jsp">注册</a>
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

			<li><a href="#two">进入版块</a></li>
			<li><a href="#three">用户个人中心</a></li>
			<li><a href="#four">查找内容</a></li>
			<li><a href="login.jsp">退出登陆</a></li>
		</ul>
		</nav> </section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one">
			<div class="container">
				<header class="major">
				<h2>Go In</h2>
				<p>只做宠物狗的论坛</p>
				</header>
				<p>For many people, a pet can be their most loyal companion - a
					trusted soul-mate with whom they experience the highs and lows of
					life.</p>
			</div>
			</section>
			<!-- Two -->
			<section id="two">
			<div class="container">
				<div id="topiclist">

					<c:if test="${sessionScope.userinfo.u_identity==1 }">
						<a href="addsection.jsp">增加版块</a>
					</c:if>
					<table width="500px">
						<tr>
							<td>板块名</td>
							<td>板块介绍</td>
						</tr>

						<c:forEach items="${sectionlist }" var="sl">
							<tr>
								<td><a
									href="topiclist.action?s_name=${sl.s_name }&s_id=${sl.s_id}">${sl.s_name }</a></td>
								<td>${sl.s_tips }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			</section>





			<!-- Three -->
			<section id="three">
			<div class="container">
				<h3>用户管理中心</h3>
				<c:if test="${sessionScope.userinfo.u_name==null }">
					请先登录
				</c:if>
				<c:if test="${sessionScope.userinfo.u_name!=null }">
					<div class="features">
						<article> <a href="#" class="image"><img
							src="images/pic01.jpg" alt="" /></a>
						<div class="inner">
							<a href="updatepassword.jsp"><h4>修改密码</h4></a> <a
								href="updateuserinfo.jsp"><h4>修改用户信息</h4></a> <a
								href="usertopic?topic.t_u_id=${sessionScope.userinfo.u_id}"><h4>查看我的帖子</h4></a>
							<a href="userreply?reply.r_u_id=${sessionScope.userinfo.u_id}"><h4>查看我的回帖</h4></a>
						</div>
						</article>
						<c:if test="${sessionScope.userinfo.u_identity==1 }">
							<article> <a href="#" class="image"><img
								src="images/pic02.jpg" alt="" /></a>
							<div class="inner">
								<a href="userlist.action"><h4>查看用户列表</h4></a> <a
									href="forbiduserlist.action"><h4>查看封禁用户列表</h4></a>
							</div>
							</article>
						</c:if>
					</div>
				</c:if>
			</div>
			</section>

			<section id="four">
			<div class="container">
				<h3>Search</h3>

				<br>
				<form action="searchtopic" method="post">

					<table>
						<tr style="background: white;">
							<td>输入帖子关键字</td>
							<td><input type="text" name="searchtopic"  required="required"></td>
						</tr>
						<tr>
							<td><input type="submit" value="点击查找帖子"></td>
						</tr>
					</table>
				</form>
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