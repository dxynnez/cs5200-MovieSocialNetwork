<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String name = null==request.getParameter("name")?"":request.getParameter("name");
String dates = null==request.getParameter("dates")?"":request.getParameter("dates");
String types = null==request.getParameter("types")?"":request.getParameter("types");
String countries = null==request.getParameter("countries")?"":request.getParameter("countries");
String key = "e683ef51597c53f6a79052f772c78330";

request.setAttribute("key",key);
request.setAttribute("name",name);
request.setAttribute("dates",dates);
request.setAttribute("types",types);
request.setAttribute("countries",countries);
%>
<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <base href="<%=basePath%>">
    
  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		ul, ol {
padding: 0;
margin: 0 0 10px 25px;
}
.span4{
	display: block;
float: left;
width: 380px;
height: 275px;
margin:10px;
border:1px solid #ccc;
padding:10px;
}

.right{
	float:right;
	color:red;
}
	</style>
	<script src="style/js/jquery.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Result</title>
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
				<img src="style/images/logo.png" alt="" />
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


<div class="box">

	<h1 class="title">Search Result</h1>
		
	<div class="one-half" align="center">
	<ul class="thumbnails" id="movies">
  </ul>
            <script type="text/javascript" >
            $(document).ready(function(){
            	if("${name}"!=""){
            		getMoviesMyName("${name}");
            	}else{
            		getMovies("${dates}","${types}","${countries}");
            	}
            });
            	function getMoviesMyName(name){
            		$.ajax({
            			   type: "GET",
            			   url: "https://api.themoviedb.org/3/search/movie?query="+name+"&language=en&api_key=${key}",
            			   dataType:"json",
            			   success: function(msg){
            				   var results = msg.results;
            				   createTable(results)
            			   }
            			});
            	}
            	
            	function getMovies(dates,types,countries){
            		var url = "https://api.themoviedb.org/3/discover/movie?api_key=${key}&sort_by=vote_average.desc"
            		if(dates=="1"){
            			url += "&primary_release_date.lte=1990-12-31";
            		}else if(dates=="2"){
            			url += "&primary_release_date.lte=1999-12-31";
            			url += "&primary_release_date.gte=1991-01-01";
            		}else if(dates=="3"){
            			url += "&primary_release_date.lte=2010-12-31";
            			url += "&primary_release_date.gte=2000-01-01";
            		}else if(dates=="4"){
            			url += "&primary_release_date.gte=2011-01-01";
            		}
            		
            		if(countries!=""){
            			url += "&certification_country="+countries;
            		}
            		
            		if(types!=""){
            			url += "&with_genres="+types;
            		}
            		$.ajax({
         			   type: "GET",
         			   url: url,
         			   dataType:"json",
         			   success: function(msg){
         				   var results = msg.results;
         				   createTable(results)
         			   }
         			});
            	}
            	
            	function createTable(results){
            		var html = "";
            		
            		for(var i=0;i<results.length;i++){
            			var result = results[i];
            			var id= $.trim(result.id);
            			var backdrop_path = result.backdrop_path;
            			var original_title = result.original_title;
            			var vote_average = result.vote_average;
            			
            			html += '<li class="span4">';
            			html += '  <div class="thumbnail">';
            			html += '    <img alt="382x200" src="http://image.tmdb.org/t/p/w500/'+backdrop_path+'?api_key=${key}" style="width: 382px; height: 200px;">';
            			html += '    <div class="caption">';
            			html += '      <h3><a href="Moviewithcomments.jsp?id='+id+'&username='+getPara("username")+'">'+original_title+'</a><span class="right">'+vote_average+'</span></h3>';
            			html += '      <p></p>';
            			html += '      <p></p>';
            			html += '     </div>';
            			html += '    </div>';
						html += '  </li>';
            		}
            		
            		if(html!=""){
            			$("#movies").empty().append(html);
            		}
            	}
            </script>
  
  

</div>
</div>
<!-- End Wrapper -->

 
<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>