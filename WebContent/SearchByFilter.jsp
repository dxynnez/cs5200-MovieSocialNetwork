<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String key = "e683ef51597c53f6a79052f772c78330";
request.setAttribute("key",key);
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<base href="<%=basePath%>">
    
    <title>Search by fileds</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="style/js/jquery.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

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

<!-- Begin Container -->


	<h1 class="title"align="center">Search by fileds</h1>
		
	<div style="margin:100px 500px 200px 500px">
	<form id="show" action="" method="post">
    <table>
    	<tr>
    		<th><h2>Dates</h2></th>
    		<td>
    			<select name="dates">
    				<option value="">Click to select</option>
    				<option value="1">Before 1990</option>
    				<option value="2">1991--1999</option>
    				<option value="3">2000--2010</option>
    				<option value="4">2011--Now</option>
    			</select>
    		</td>
    	</tr>
   
    
    		<tr>
    		<th><h2>Types</h2></th>
    		<td>
    			<select name="types" id="types">
    				<option value="">Click to select</option>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<th><h2>Countries</h2></th>
    		<td>
    			<select name="countries">
    				<option value="">Click to select</option>
    				<option value="CN">China</option>
    				<option value="US">United States</option>
    				<option value="IN">India</option>
    			</select>
    		</td>
    	</tr>
    </table>
    	<div style="margin:50px 0px 0px 0px">
    	<input type="submit" value="Search" style="height: 60px;">
    	</div>
    </form>
    <script type="text/javascript">
    	$(document).ready(function(){
    		appendGenres();
    	});
    	
    	function appendGenres(){
    		$.ajax({
 			   type: "GET",
 			   url: "http://api.themoviedb.org/3/genre/list?api_key=${key}",
 			   dataType:"json",
 			   success: function(msg){
 				   var results = msg.genres;
 				   var html = "";
 				   for(var i=0;i<results.length;i++){
 					   var result = results[i];
 					   var id = result.id;
 					   var name = result.name;
 					   
 					   html += "<option value='"+id+"'>"+name+"</option>";
 				   }
 				   if(html!=""){
 					   $("#types").append(html);
 				   }
 			   }
 			});
    	}
    	var href = "result.jsp?username="+getPara("username");
    	document.getElementById("show").action=href;
    </script>
    </div>
    


<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>