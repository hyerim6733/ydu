
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>DevOOPS</title>
<meta name="description" content="description">
<meta name="author" content="DevOOPS">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/plugins/bootstrap/bootstrap.css" rel="stylesheet">
<link href="resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<link href="resources/plugins/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="resources/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link href="resources/plugins/xcharts/xcharts.min.css" rel="stylesheet">
<link href="resources/plugins/select2/select2.css" rel="stylesheet">
<link href="resources/tiles/css/style.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">

<script src="resources/plugins/jquery/jquery-2.1.0.min.js"></script>
<script src="resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
<script
	src="resources/plugins/justified-gallery/jquery.justifiedgallery.min.js"></script>
<script src="resources/plugins/tinymce/tinymce.min.js"></script>
<script src="resources/plugins/tinymce/jquery.tinymce.min.js"></script>
<!-- All functions for this theme + document.ready processing -->
<!-- <script src="resources/js/devoops.js"></script>  -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->
<script>
	$(function() {
		 $("#username").focus();
		
		 $("#password").keypress(function (e) {
		        if (e.which == 13){
		        	mainLogin(e); // 실행할 이벤트
		        }
		    });
		 
		$("#signIn").click(mainLogin);
				
		function mainLogin(event) {
			event.preventDefault();
			var userId = $("#username").val();
			var userPw = $("#password").val();
			console.log(userId);
			console.log(userPw);
			var userInfo = {
				"userid" : userId,
				"userpw" : userPw
			};

			$.ajax({
				url : "../login.do",
				data : userInfo,
				method : "post",
				type : "json",
				//		contentType : "application/json",
				success : function(data) {
					if (data == "success") {
						$(location).attr('href', "index");
					} else {
						alert("failed");
					}
				},
				error : function(request, status, error) {
					alert("아이디와 패스워드를 확인주세요."); 
					/* alert(error); */
				}
			});
		}
	});
</script>
</head>

<body>
	<div class="container-fluid">
		<div id="page-login" class="row">
			<div
				class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
				<div class="text-right">
					<a href="page_register.html" class="txt-default">Need an
						account?</a>
				</div>
				<div class="box">
					<div class="box-content">
						<div class="text-center">
							<h3 class="page-header">YeDam Login Page</h3>
						</div>
						<div class="form-group">
							<label class="control-label">Username</label> <input type="text"
								class="form-control" name="username" id="username" />
						</div>
						<div class="form-group">
							<label class="control-label">Password</label> <input
								type="password" class="form-control" name="password"
								id="password" />
						</div>
						<div class="text-center">
						<a	href="../index.html" class="btn btn-primary" id="signIn">Sign in</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
