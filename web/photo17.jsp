<%--
  Created by IntelliJ IDEA.
  User: liuchen6
  Date: 2016/6/29
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
	String path=request.getContextPath();
%>
<head>
	<title>Photo</title>
	<link rel='stylesheet' id='camera-css'  href="<%=path%>/common/css/camera.css" type='text/css' media='all'>
	<style>
		html,body {
			height: 100%;
			margin: 0;
			padding: 0;
		}
		a {
			color: #09f;
		}
		a:hover {
			text-decoration: none;
		}
		#back_to_camera {
			background: rgba(255,255,255,.9);
			clear: both;
			display: block;
			height: 40px;
			line-height: 40px;
			padding: 20px;
			position: relative;
			z-index: 1;
		}
		.fluid_container {
			bottom: 0;
			height: 100%;
			left: 0;
			position: fixed;
			right: 0;
			top: 0;
			z-index: 0;
		}
		#camera_wrap_4 {
			bottom: 0;
			height: 100%;
			left: 0;
			margin-bottom: 0!important;
			position: fixed;
			right: 0;
			top: 0;
		}
		.camera_bar {
			z-index: 2;
		}
		.camera_thumbs {
			margin-top: -100px;
			position: relative;
			z-index: 1;
		}
		.camera_thumbs_cont {
			border-radius: 0;
			-moz-border-radius: 0;
			-webkit-border-radius: 0;
		}
		.camera_overlayer {
			opacity: .1;
		}
	</style>
	<script src="<%=path%>/common/jquery/jquery1.7.min.js"></script>
	<%--<script type='text/javascript' src="<%=path%>/common/js/jquery/jquery.min.js"></script>--%>
<%--	<script type='text/javascript' src="<%=path%>/common/jquery/jquery.mobile.customized.min.js"></script>--%>
	<script type='text/javascript' src="<%=path%>/common/jquery/jquery.easing.1.3.js"></script>
	<script type='text/javascript' src="<%=path%>/common/camera/camera.js"></script>
	<script>
		jQuery(function(){
			jQuery('#camera_wrap_4').camera({
				height: 'auto',
				loader: 'bar',
				pagination: false,
				thumbnails: true,
				hover: false,
				opacityOnGrid: false,
				imagePath: '../images/'
			});

		});
	</script>
</head>
<body>
<div class="fluid_container">
	<div id="camera_wrap_4">
		<div data-thumb="<%=path%>/common/images/thumbs/bridge.jpg" data-src="/common/images/photo/bridge.jpg">
		</div>
		<div data-thumb="<%=path%>/common/images/thumbs/leaf.jpg" data-src="/common/images/photo/leaf.jpg">
		</div>
		<div data-thumb="<%=path%>/common/images/thumbs/sea.jpg" data-src="/common/images/photo/sea.jpg">
		</div>
	</div><!-- #camera_wrap_3 -->
</div><!-- .fluid_container -->
</body>
</html>
