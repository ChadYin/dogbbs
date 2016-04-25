<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>登录</title>
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

<script type="text/javascript">
	function login() {
		var obj = document.getElementById("text1");
		obj.setAttribute("value", "");
	}
</script>
<script type="text/javascript">
	function check() {
		var text1 = document.getElementById("text1").value;
		var password = document.getElementById("password").value;

		if (text1 != "" && password != "") {
			return true;

		} else {
			alert("请填好所有信息");
			return false;
		}

	}
</script>
</head>
<body>
	<div class="container">


		<section>
		<div id="container_demo">

			<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
				id="tologin"></a>
			<div id="wrapper">
				<div id="login" class="animate form">
					<form action="login" namespace="/" theme="simple"
						onsubmit="return check()">
						<h1>Log in</h1>
						<p>
							<label for="username" class="uname" data-icon="u"> Your email or username </label> 
							<input type="text" name="user.u_email" id="text1" value="用户名或邮箱" onfocus="login()" />
						</p>
						<p>
							<label for="password" class="youpasswd" data-icon="p"> Your password </label> 
							<input name="user.u_password" type="password" id="password" />
						</p>

						<p class="login button">
							<input type="submit" value="Login" />
						</p>

					</form>
				</div>



			</div>
		</div>
		</section>
	</div>
</body>
</html>