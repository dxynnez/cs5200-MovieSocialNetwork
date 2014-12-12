<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
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
<body class="single">
<script> 
var urlPara = location.search;
function getPara(paraName){ 
var reg = new RegExp("[&|?]"+paraName+"=([^&$]*)", "gi"); 
var a = reg.test(urlPara); 
return a ? RegExp.$1 : ""; 
}

function remove(message) {
	
	$.ajax({
		url : "/movieProject/api/message/delete/"+message,
		type:"delete",
		dataType: "json",
		contentType: "application/json",
		success:function(response) {
			console.log(response);
			alert("success");
		}
	});
	
}

window.onload = function(){
	var username = getPara("username");
	var source = "";
	id1=document.getElementById("index");
	id1.href="index.jsp?username="+username;
	id1=document.getElementById("index2");
	id1.href="index.jsp?username="+username;
	if(username != ""){
		temp=document.getElementById("filter");
		temp.href="SearchByFilter.jsp?username="+getPara("username");
		temp1=document.getElementById("search");
		temp1.href="search.jsp?username="+getPara("username");
		$.ajax(
				{
					url: "/movieProject/api/user/"+username,
					type: "GET",
					dataType: "text",
					contentType: "application/json",
					success: function(response) {
	//					console.log(response);
						//alert(response);
						response = JSON.parse(response);
						$("#username").append(response.username);
						$("#introduction").append(response.description);
//						id1.innerHTML = response.description;
					},
					error: function(response) {
						alert("error");
						//console.log(response);
					}
				});
		
		$.ajax(
				{
					url: "/movieProject/api/userlike/user/"+username,
					type: "GET",
					dataType: "text",
					contentType: "application/json",
					success: function(response) {
	//					console.log(response);
						response = JSON.parse(response);
						for(var i=0; i<response.length;i++){
		            		$.ajax(
		            				{
		            					url: "/movieProject/api/movie/"+response[i].name,
		            					type: "GET",
		            					dataType: "json",
		            					contentType: "application/json",
		            					async: false,
		            					success: function(msg) {
		            						source = eval('(' + msg.src + ')'); 
		            					},
		            					error: function(response) {
		            					}
		            		});
							$("#movie").append("<li> <div class=\"frame\"> <a href=\"Moviewithcomments.jsp?id="+source+"&username="+getPara("username")+"\"><img src=\"style/images/art/s1.jpg\"/></a> </div> <div class=\"meta\"> <h6><a id=movie href=\"Moviewithcomments.jsp?id="+source+"&username="+getPara("username")+"\">"+response[i].name+"</a></h6> </div> </li>");

						}
//						id1.innerHTML = response.description;
					},
					error: function(response) {
						alert(response+"error");
						//console.log(response);
					}
				});
		$.ajax(
				{
					url: "/movieProject/api/message/"+username,
					type: "GET",
					dataType: "text",
					contentType: "application/json",
					success: function(response) {
	//					console.log(response);
						//alert(response);
						response = JSON.parse(response);
						for(var i=0; i<response.length;i++){
							$("#singlecomments").append("<li class=\"comment\"><div class=\"comment\"><div class=\"comment-author vcard user frame\"><img alt=\"\" src='http://1.gravatar.com/avatar/30b2dad884c817cb09ad5fa61dad7e44?s=70&amp;d=retro&amp;r=G' class='avatar avatar-70 photo' height='70' width='70' /></div><div class=\"message\"><span class=\"reply-link\"><a class=\"comment-reply-link\" href=\"javascript:remove("+response[i].id+");\">Delete</a></span><div class=\"info\"><h2>"+response[i].sender+"</h2></div><div class=\"comment-body \"><p>"+response[i].message+"</p></div><span class=\"edit-link\"></span></div><div class=\"clear\"></div></div><div class=\"clear\"></div></li>");
						}
//						id1.innerHTML = response.description;
					},
					error: function(response) {
						alert("error");
						//console.log(response);
					}
				});
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
				<img src="style/images/logo.png" alt="" />
			</a>
	    </div>
		<!-- End Logo -->
		<!-- Begin Menu -->
		<div id="menu-wrapper">
			<div id="menu" class="menu">
				<ul id="tiny">
					<li class="active"><a id="index2" href="">Home Page</a>
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
<div class="wrapper"><!-- Begin Intro -->
	<!-- Begin Main Image -->
	<div class="main-image">
		<div class="outer">
			<span class="inset"><img src="style/images/art/post1-full.jpg" alt="" /></span>
		</div>
	</div>
	<!-- End Main Image --> 


<!-- Begin Container -->
<div class="content">

		<!-- Begin Post -->
		<div class="post format-image box"> 

			<div class="details">
				<h1 class="title" id="username"></h1>
			</div>
		
			<h1 class="title">Introduction</h1>
			<p id="introduction"></p>

		</div>
		<!-- End Post --> 	
	
		<!-- Begin Comment Wrapper -->
		<div id="comment-wrapper" class="box">
		  
		  <!-- Begin Comments -->
		  <div id="comments">
	            
			<h3 id="comments-title">Message</h3>
	    
	        <ol id="singlecomments" class="commentlist">
			</ol>
		</div>
		<!-- End Comments -->
	
		<!-- Begin Form -->

		<!-- End Form -->	
		
		
		</div>	
		<!-- End Comment Wrapper -->

</div>
<!-- End Container -->

<!-- Begin Sidebar -->
<div class="sidebar box">
  <div class="sidebox widget">
			<h3 class="widget-title">I Like</h3>
			<ul id=movie class="post-list">
			</ul>
			
	</div>
	</div>
<!--End Sidebar -->
<div class="clear"></div>

</div>
<!-- End Wrapper -->

<!-- Begin Footer -->
<div class="footer-wrapper">
<div id="footer" class="four">
		<div id="first" class="widget-area">
			<div class="widget widget_search">
				<h3 class="widget-title">Search</h3>
				<form class="searchform" method="get" action="#">
					<input type="text" name="s" value="type and hit enter" onFocus="this.value=''" onBlur="this.value='type and hit enter'"/>
				</form>
			</div>	
		</div><!-- #first .widget-area -->
	
		<div id="second" class="widget-area">
			<div id="twitter-2" class="widget widget_twitter">
					<h3 class="widget-title">Twitter</h3>
					
					<div id="twitter-wrapper">
						<div id="twitter"></div>
						<span class="username"><a href="http://twitter.com/XiangyiDeng">→ Follow @Xiangyi Deng</a></span>
					</div>
			</div>
		</div><!-- #second .widget-area -->
		</div>
	</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>