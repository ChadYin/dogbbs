<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>注册</title>
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
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrollzer.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script type="text/javascript">
	function login() {
		var obj = document.getElementById("text1");
		obj.setAttribute("value", "");
	}
</script>
<script type="text/javascript">
	var isOk = false;
	var XMLHttp;
	
	function createXMLHttpRequest() {
		try {
			XMLHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				XMLHttp = new ActiveXObject("Mcrisoft.XMLHTTP");
			} catch (e) {
				try {
					XMLHttp = new XMLHttpRequest();
					if (XMLHttp.overrideMimeType) {
						XMLHttp.overrideMimeType("text/xml");
					}

				} catch (e) {

				}
			}
		}
	}
	
	
	function uname(){
		createXMLHttpRequest();
		var name = document.getElementById("u_name").value;
		if (XMLHttp != null) {
			XMLHttp.open("post", "checkuname.action?u_name=" + name, true);
			XMLHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
			XMLHttp.onreadystatechange = processRequest;
			XMLHttp.send(null);
		} else {
			alert("不能创建XMLHttpRequest对象查询");
		}
	}
	
	function processRequest() {

		if (XMLHttp.readyState == 4) {
			if (XMLHttp.status == 200) {

				var sobj = document.getElementById("check");
				var str = XMLHttp.responseText;
				var a = document.getElementById("aaa");
				if (str == 1) {
					a.setAttribute("value", "0");
					sobj.setAttribute("style", "display:block;");
				} else {
					a.setAttribute("value", "1");
					sobj.setAttribute("style", "display:none;");
				}
			}
		}
	}
	
	function checkmail() {
		
		var email = document.getElementById("u_email").value;
		var strReg = "";
		var r;
		strReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		r = email.search(strReg);
		if (r == -1) {
			alert("邮箱格式错误!");
		}else{
			isOk=true;
		}
	}
	
	function checknumber(){
		var number = document.getElementById("number").value();
		var strReg = "";
		var r;
		strReg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		r = number.search(strReg);
		if (r == -1) {
			alert("身份证号格式错误!");
		}else{
			isOk=true;
		}
	}
	
	
	function check() {
		var u_name = document.getElementById("u_name").value;
		var u_email = document.getElementById("u_email").value;
		var u_password = document.getElementById("u_password").value;
		var u_realname = document.getElementById("u_realname").value;
		var u_number = document.getElementById("u_number").value;
		var u_tips = document.getElementById("u_tips").value;
		var a = document.getElementById("aaa").value;
		if(a==1){
			isOk=true;
		}else{
			isOk=false;
		}
		if (isOk && u_name != "" && u_email != "" && u_password != "" && u_realname != "" && u_number != ""&& u_tips != "") {
			return true;

		} else {
			alert("请正确填写信息");
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
					<form action="regist" method="post" onsubmit="return check()">
						<h1>Regist</h1>
						<p>
							<label for="username" class="uname" data-icon="u"> 用户名 </label> <input
								type="text" id="u_name" name="user.u_name" required="required" onchange="uname()">
								<span id="check" style="display: none;">用户名已存在</span>
						</p>
						<p>
							<label for="email" class="youpasswd" data-icon="e"> 邮箱 </label> <input
								type="text" id="u_email" name="user.u_email" required="required" onchange="checkmail()">
						</p>
						<p>
							<label for="password" class="youpasswd" data-icon="p"> 密码
							</label> <input type="text" id="u_password" name="user.u_password" required="required" >
						</p>
						<p>
							<label for="realname" class="youpasswd" data-icon="u">
								真实姓名 </label> <input type="text" id="u_realname" name="user.u_realname" required="required" >
						</p>
						<p>
							<label for="number" class="youpasswd" data-icon="p"> 身份证号
							</label> <input type="text" id="u_number" name="user.u_number" required="required" onchange="checknumber()">
						</p>
						<p>
							<label for="tips" class="youpasswd" data-icon="u"> 个性签名 </label>
							<input type="text" id="u_tips" name="user.u_tips">
						</p>


						<p class="login button">
						<input type="hidden" id="aaa" value="1">
							<input type="submit" value="注册" />
						</p>

					</form>
				</div>



			</div>
		</div>
		</section>
	</div>
</body>
</html>