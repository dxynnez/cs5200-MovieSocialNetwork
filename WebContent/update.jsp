<!DOCTYPE HTML>
<jsp lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Obscura</title>
<link rel="stylesheet" type="text/css" media="all" href="style.css" />
<link rel="stylesheet" type="text/css" href="style/css/media-queries.css" />
<link rel="stylesheet" type="text/css" href="style/js/player/mediaelementplayer.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,300italic,300,700,700italic|Open+Sans+Condensed:300,700' rel="stylesheet" type='text/css'>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="style/css/ie8.css" media="all" />
<![endif]-->
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="style/css/ie9.css" media="all" />
<![endif]-->
<script type="text/javascript" src="style/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="style/js/retina.js"></script>
<script type="text/javascript" src="style/js/selectnav.js"></script>
<script type="text/javascript" src="style/js/jquery.masonry.min.js"></script>
<script type="text/javascript" src="style/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="style/js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="style/js/mediaelement.min.js"></script>
<script type="text/javascript" src="style/js/mediaelementplayer.min.js"></script>
<script type="text/javascript" src="style/js/jquery.dcflickr.1.0.js"></script>
<script type="text/javascript" src="style/js/twitter.min.js"></script>
<script type="text/javascript">
	$.backstretch("style/images/bg/1.jpg");
</script>
</head>
<body>
<script>
var urlPara = location.search;
function getPara(paraName){ 
var reg = new RegExp("[&|?]"+paraName+"=([^&$]*)", "gi"); 
var a = reg.test(urlPara); 
return a ? RegExp.$1 : ""; 
}
	function updateUserSeverlet()
		{
			$(function()
			{
				var user =
				{
					username: getPara("username"),
					password: document.getElementById("password").value,
					email: document.getElementById("email").value,
					src: document.getElementById("src").value,
					description: document.getElementById("description").value
				};
				updateUser(user);
			});
		}

	function updateUser(user){

		$.ajax(
				{
					url: "api/user/update/"+getPara("username"),
					type:"put",
					data: JSON.stringify(user),
					dataType: "json",
					contentType: "application/json",
					success:function(response) {
						console.log(response);
						alert("success");
						window.location.href="index.jsp?username="+getPara("username"); 
					}
				});
	}
	
	window.onload = function(){
		var username = getPara("username");

		if(username != ""){
			id1=document.getElementById("index");
			id1.href="index.jsp?username="+username;
			id1=document.getElementById("index2");
			id1.href="user.jsp?username="+username;
			id1.innerHTML = "Personal Homepage";
			temp=document.getElementById("filter");
			temp.href="SearchByFilter.jsp?username="+getPara("username");
			temp1=document.getElementById("search");
			temp1.href="search.jsp?username="+getPara("username");
		}
	}
</script>

<div class="scanlines"></div>

<!-- Begin Header -->
<div class="header-wrapper opacity">
	<div class="header">
		<!-- Begin Logo -->
		<div class="logo">
		    <a id="index" href="index.jsp">
				<img src="style/images/logo.png"/>
			</a>
	    </div>
		<!-- End Logo -->
		<!-- Begin Menu -->
		<div id="menu-wrapper">
			<div id="menu" class="menu">
				<ul id="tiny">
					<li class="active"><a id="index2" href="index.jsp">Home Page</a>
					</li>
					<li><a id="filter" href="SearchByFilter.jsp">Search by Filter</a>
					</li>
					<li><a id="search"href="search.jsp">Search by Name</a>
					</li>
					<li><a href="index.jsp">Log Out</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<!-- End Menu -->
	</div>
</div>
<!-- End Header -->

<!-- Begin Wrapper -->

<!-- Begin Container -->
<div class="content box">

	<h1 class="title">Update Personal Information</h1>

<div class="form-container">
				<li class="form-row text-input-row"><label>Email</label><input type="text" id="email" name="email" value="" class="text-input required email" title="" /></li> 
				<li class="form-row text-input-row"><label>Password</label><input type="text" id="password" name="password" value="" class="text-input required" title="" /></li>
				<li class="form-row text-input-row"><label>Description</label><input type="text" id="description" name="description" value="" class="text-input required" title="" /></li> 
				<li class="form-row text-input-row"><label>Head Portrait</label><input type="text" id="src" name="src" value="" class="text-input required" title="" /></li>
				<li class="button-row"><button name="Submit" value="submit" onclick="updateUserSeverlet();">Submit</button></li>
</div>



</div>
<!-- End Container -->

<!-- Begin Sidebar -->
<div class="sidebar box">
  <div class="sidebox widget">
			<h3 class="widget-title">Where Are We?</h3>
			<p>360 Huntington Ave,Boston,MA</p>
			<p>
				
				<span class="lite1">Tel:</span> 617 306 6282<br />
				<span class="lite1">E-mail:</span> hu.zi@husky.neu.edu
			</p>
			
	</div>
	
	<div class="sidebox widget">
		<h3 class="widget-title">Custom Text</h3>
		<p>Thank you for coming to My Projector.</p>
	</div>
	
</div>
<!--End Sidebar -->
<div class="clear"></div>

</div>
<!-- End Wrapper -->

<!-- Begin Footer -->

<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>