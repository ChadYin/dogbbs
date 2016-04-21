<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo11.css" />
<link rel="stylesheet" type="text/css" href="css/style11.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<title>修改密码</title>
</head>
<body>
	<div class="container">


		<section>
		<div id="container_demo">

			<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
				id="tologin"></a>
			<div id="wrapper">
				<div id="login" class="animate form">
					<form action="updateuserinfo" namespace="/" theme="simple">
						<h1>Update Inf</h1>
						<p>
							<label for="username" class="uname" data-icon="u"> 用户名 </label> <input
								type="text" value="${sessionScope.userinfo.u_name }"
								name="user.u_name" readonly="readonly">
						</p>
						<p>
							<label for="password" class="youpasswd" data-icon="u">
								真实姓名 </label> <input type="text"
								value="${sessionScope.userinfo.u_realname }"
								name="user.u_realname">
						</p>
						<p>
							<label for="password" class="youpasswd" data-icon="u">
								身份证号 </label> <input type="text"
								value="${sessionScope.userinfo.u_number }" name="user.u_number">
						</p>
						<p>
							<label for="password" class="youpasswd" data-icon="e">
								个性签名 </label> <input type="text"
								value="${sessionScope.userinfo.u_tips }" name="user.u_tips">
						</p>

						<p class="login button">
							<input type="submit" value="确定" /><input type="reset" value="重置" />
						</p>

					</form>
				</div>



			</div>
		</div>
		</section>
	</div>
</body>
</html>