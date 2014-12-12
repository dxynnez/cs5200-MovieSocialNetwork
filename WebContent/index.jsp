<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Movie Space</title>
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

window.onload = function(){
	var username = getPara("username");
	if(username != ""){
		temp=document.getElementById("filter");
		temp.href="SearchByFilter.jsp?username="+getPara("username");
		temp1=document.getElementById("search");
		temp1.href="search.jsp?username="+getPara("username");
		id1=document.getElementById("register");
		id1.href="user.jsp?username="+getPara("username");
		id1.innerHTML="Personal Homepage";
		id1=document.getElementById("index");
		id1.href="index.jsp?username="+getPara("username");
		id2=document.getElementById("login1");
		id2.href="update.jsp?username="+getPara("username");
		id2.innerHTML="Update Info";
		id3=document.getElementById("login2");
		id3.innerHTML="";
		var age = "Moviewithcomments.jsp?id=99861&username="+getPara("username");
		document.getElementById("age").href=age;
		var furious = "Moviewithcomments.jsp?id=168259&username="+getPara("username");
		document.getElementById("furious").href=furious;
		var terminator = "Moviewithcomments.jsp?id=87101&username="+getPara("username");
		document.getElementById("terminator").href=terminator;
		var batman = "Moviewithcomments.jsp?id=209112&username="+getPara("username");
		document.getElementById("batman").href=batman;
		
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
						$("#profile").attr("src",response.src);
//						id1.innerHTML = response.description;
					},
					error: function(response) {
						alert("error");
						//console.log(response);
					}
				});
	}
	else{
		id1=document.getElementById("homepage");
		id1.href="register.jsp";
		id1.innerHTML="Become a free member today!";
		document.getElementById("follower").innerHTML="";
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
				<!-- login -->
					<li class="active"><a id="login1" href="index.jsp">Login</a>
						<ul id="login2">
							<form action="LoginServlet">
							<li><a>Username: <input name="username" id="username" value="UserName" type="text" size="10" onclick="if(value==defaultValue)
                			{value='';this.style.color='#999'}" onBlur="if(!value) {value=defaultValue;this.style.color='#999'}" style="color:#999"/></a></li>
							<li><a>Password: <input name="password" id="password" value="Password" type="password" size="10" onclick="if(value==defaultValue)
                			{value='';this.style.color='#999'}" onBlur="if(!value) {value=defaultValue;this.style.color='#999'}" style="color:#999"/></a></li>
                			<li><a><button name="action" value="login">Login</button></a></li>
                			</form>
						</ul>
					</li>
				<!-- login end -->
					<li class="active"><a id="register" href="register.jsp">Register</a></li>
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
<div class="intro"> "Frankly, my dear, I don't give a damn."    ——    Gone With the Wind (1939)</div>
<div class="intro"> "You don't understand! I coulda had class. I coulda been a contender. I could've been somebody, instead of a bum, which is what I am."     ——     On the Waterfront (1954)</div>
 <br />
  <br />
<!-- Begin Blog Grid -->
<div class="blog-wrap">
	<!-- Begin Blog -->
	<div class="blog-grid">
		<!-- Begin Image Format -->
		<div class="post format-image box"> 
			<div class="frame">
					<img id="profile" src="style/images/art/post1.jpg" alt="" />
			</div>
			<h2 class="title"><a id="homepage" href="user.jsp?username=<%=request.getParameter("username")%>">Personal Homepage</a></h2>
			<h2 class="title" id="follower"><a href="Followers.jsp?username=<%=request.getParameter("username")%>">Follower</a></h2>
		</div>
		<!-- End Image Format -->

<!-- Begin Video Format -->
		<div class="post format-video box"> 
			<div class="video frame"><iframe width="490" height="400" src="//www.youtube.com/embed/rD8lWtcgeyg" frameborder="0" allowfullscreen></iframe></div>
			<h2 class="title"><a id="age" href="Moviewithcomments.jsp?id=99861">Avengers: Age of Ultron </a></h2>
			<p>When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earth’s Mightiest Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.</p>
		
			<div class="details">
				<span class="icon-video"><a >September 13, 2014</a></span>
			</div>
			
		</div>
		<!-- End Video Format --> 					


		<!-- Begin Video Format -->
		<div class="post format-video box"> 
			<div class="video frame"><<iframe width="640" height="390" src="//www.youtube.com/embed/Skpu5HaVkOc" frameborder="0" allowfullscreen></iframe></div>
			<h2 class="title"><a id="furious" href="Moviewithcomments.jsp?id=168259"> Furious 7</a></h2>
			<p>Ian Shaw seeks revenge against Dominic Toretto and his crew for the death of his brother.</p>		
			<div class="details">
				<span class="icon-video"><a>September 13, 2014</a></span>
			</div>
			
		</div>
		<!-- End Video Format --> 			

			
 		<!-- Begin Standard Format -->
 		<div class="post format-standard box"> 
 		
 		<img src="https://image.tmdb.org/t/p/w185/qOoFD4HD9a2EEUymdzBQN9XF1UJ.jpg"/>

			<h2 class="title"><a id="terminator" href="Moviewithcomments.jsp?id=87101">Terminator 5</a></h2>
			<p>The year is 2029. John Connor, leader of the resistance continues the war against the machines. At the Los Angeles offensive, John's fears of the unknown future begin to emerge when TECOM spies reveal a new plot by SkyNet that will attack him from both fronts; past and future, and will ultimately change warfare forever.

			</p>	
			<div class="details">
				<span class="icon-standard"><a >August 13, 2014</a></span>
			</div>
	
		</div>
		<!-- End Standard Format --> 					


		<!-- Begin Standard Format -->
 		<div class="post format-standard box"> 
 		
 		<img src="https://image.tmdb.org/t/p/w780/ixP34oOeBozzQMDpByyT9Ydl2JZ.jpg"/>

			<h2 class="title"><a id="batman" href="Moviewithcomments.jsp?id=209112">Batman v Superman: Dawn of Justice </a></h2>
			<p>the plot has not been disclosed at this time.
			</p>	
			<div class="details">
				<span class="icon-standard"><a >August 13, 2014</a></span>
			</div>
	
		</div>
		<!-- End Standard Format --> 
		
 	
 	</div>
	<!-- End Blog -->
</div>
<!-- End Blog Grid -->

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
						<span class="username"><a href="http://twitter.com/XiangyiDeng">→ Follow @XiangyiDeng</a></span>
					</div>
			</div>
		</div><!-- #second .widget-area -->
	</div>
</div>
<!-- End Footer --> 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>