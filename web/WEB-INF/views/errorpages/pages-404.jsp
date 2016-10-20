<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Error 404 - Pages </title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css"/>
	<link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/common/pixel-admin/css/pixel-admin.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/common/pixel-admin/css/widgets.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/common/pixel-admin/css/rtl.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/common/pixel-admin/css/pages.min.css" rel="stylesheet" type="text/css">
	<!--[if lt IE 9]>
    <script src="<%=path%>/common/pixel-admin/js/ie.min.js" type="text/javascript"></script>
	<![endif]-->

</head>

<body class="page-404">

<script>var init = [];</script>

	<div class="header">
		<a href="<%=path%>/admin/gotoIndex" class="logo">
			<div class="demo-logo"><img src="<%=path%>/common/pixel-admin/demo/logo-big.png" alt="" style="margin-top: -4px;"></div>&nbsp;
			<strong>Admin</strong>Index
		</a> <!-- / .logo -->
	</div> <!-- / .header -->

	<div class="error-code">404</div>

	<div class="error-text">
		<span class="oops">OOPS!</span><br>
		<span class="hr"></span>
		<br>
		SOMETHING WENT WRONG, OR THAT PAGE DOESN'T EXIST... YET
	</div> <!-- / .error-text -->

	<%--<form action="" class="search-form">
		<input type="text" class="search-input" name="s">
		<input type="submit" value="SEARCH" class="search-btn">
	</form>--%> <!-- / .search-form -->


<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write('<script src="<%=path%>/common/jquery/jquery.min.js">' + "<" + "/script>");
</script>
<!-- <![endif]-->
<!--[if lte IE 9]>
<script type="text/javascript"> window.jQuery || document.write('<script src="<%=path%>/common/jquery/jquery1.8.3.min.js">' + "<" + "/script>"); </script>
<![endif]-->
<script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/common/pixel-admin/js/pixel-admin.min.js"></script>

<script type="text/javascript">
	init.push(function () {
		// Javascript code here
	})
	window.PixelAdmin.start(init);
</script>

</body>
</html>