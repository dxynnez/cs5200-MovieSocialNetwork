<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id = null==request.getParameter("id")?"":request.getParameter("id");
String key = "e683ef51597c53f6a79052f772c78330";

request.setAttribute("key",key);
request.setAttribute("id",id);
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>Obscura</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
.span4{
	display: block;
float: left;
width: 600px;
height:1000px;
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

function remove(comment) {
	
	$.ajax({
		url : "/movieProject/api/comment/delete/"+comment,
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


<div class="title">
<h1 align="Center">Detail</h1>
</div>	

	<div class="one-half">
	
<table class="span4" id="movies">
  </table>
            <script type="text/javascript">
            var moviename;
    		var decision;
            $(document).ready(function(){
            	if("${id}"!=""){
            		getMovieDetail("${id}");
            	}
            });
            	function getMovieDetail(id){
            		$.ajax({
            			   type: "GET",
            			   url: "https://api.themoviedb.org/3/movie/"+id+"?api_key=${key}",
            			   dataType:"json",
            			   success: function(msg){
            				   var result = msg;
            				   createTable(result)
            			   }
            			});
            	}
            	
            	function createTable(result){
            		var html = "";
            		
            			var backdrop_path = result.poster_path;
            			var original_title = result.original_title;
            			var vote_average = result.vote_average;
            			var release_date = result.release_date;
            			var overview = result.overview;
            			moviename = original_title;
            			
            			html +='<tr>';
            			html +='	<td colspan="2"><img alt="382x200" src="http://image.tmdb.org/t/p/w500/'+backdrop_path+'?api_key=${key}" style="width: 100%; height: 100%;"></td>';
           				html +='</tr>';
           				
           				html += '<tr><th>Title:</th><td>'+original_title+'</td></tr>';
           				html += '<tr><th>VoteAverage:</th><td>'+vote_average+'</td></tr>';
           				html += '<tr><th>ReleaseDate:</th><td>'+release_date+'</td></tr>';
           				html += '<tr><th>Overview:</th><td>'+overview+'</td></tr>';
            		
            		if(html!=""){
            			$("#movies").empty().append(html);
            		}
            		
            		$.ajax(
            				{
            					url: "/movieProject/api/comment/"+original_title,
            					type: "GET",
            					dataType: "text",
            					contentType: "application/json",
            					success: function(response) {
            						response = JSON.parse(response);
            						for(var i=0; i<response.length;i++){
            							var username = response[i].username;
            							$("#commentDetails").append("<li><a href=\"followUser.jsp?username="+response[i].username+"&follower="+getPara("username")+"\"><strong>"+response[i].username+"</strong></a>"+response[i].comment+"<div class=\"message\"><span class=\"reply-link\"><a id=\"remove"+i+"\" class=\"comment-reply-link\" href=\"javascript:remove("+response[i].id+");\"></a></span></div></li>");
            							if(username == getPara("username")){
            								var temptemp = "remove"+i;
            								tempId=document.getElementById(temptemp);
            								tempId.innerHTML="Delete";
            							}
            						}
            					},
            					error: function(response) {
            					}
            				});
            		
            		$.ajax(
            				{
            					url: "/movieProject/api/movie/"+moviename,
            					type: "GET",
            					dataType: "text",
            					contentType: "application/json",
            					success: function(response) {
            						response = JSON.parse(response);
            						decision = response.name;
            					},
            					error: function(response) {
            					}
            				});
            		if(decision != moviename){
            			createMovie(moviename);
            		}
            	}
            	
        		function createMovie(moviename){
        			var movie = {
            				name: moviename,
            				src: getPara("id")
            			};
            			$.ajax(
            				{
            					url: "/movieProject/api/movie/create/",
            					data: JSON.stringify(movie),
            					type: "post",
            					dataType: "json",
            					contentType: "application/json",
            					success: function(response) {
            						console.log(response);
            					},
            					error: function(response) {
            						console.log(response);
            					}
            				});
        		}
            	
            	function createCommentSeverlet()
            	{
            		$(function()
            		{
        				var comment =
        				{
        					id: 1,
        					comment: document.getElementById("comment").value,
        					username: getPara("username")
        				};
                		createComment(comment)
            		});
            	}
            	

            	function createComment(comment){
            		
            		$.ajax(
            				{
            					url: "/movieProject/api/comment/create/"+moviename+"&"+getPara("username"),
            					data: JSON.stringify(comment),
            					type: "post",
            					dataType: "json",
            					contentType: "application/json",
            					success: function(response) {
            						console.log(response);
            						alert("success!");
            					},
            					error: function(response) {
            						console.log(response);
            					}
            				});
            	}
            	
            	function createLikeSeverlet()
            	{
            		$(function()
            		{
        				var like =
        				{
        					id: 1
        				};
        				createLike(like)
            		});
            	}

            	function createLike(like){
      
            		$.ajax(
            				{
            					url: "/movieProject/api/userlike/create/"+moviename+"&"+getPara("username"),
            					data: JSON.stringify(like),
            					type: "post",
            					dataType: "json",
            					contentType: "application/json",
            					success: function(response) {
            						console.log(response);
            						alert("success!");
            					},
            					error: function(response) {
            						console.log(response);
            					}
            				});
            	}
            	
            </script>
 
   
<div>  
<p class="button-row">
	<button name="LIKE" value="like" onclick="createLikeSeverlet()">I like it</button>
</p>
</div>
</div>
<!-- LikeBtn.com END -->

<!-- Begin Chat Format -->
<div class="one-half last">
		<div class="post format-chat box" style="margin:10px 50px 50px 0px"> 
			<h2 class="title"><a>Comments</a></h2>
			<ul id="commentDetails">
			</ul>
			
		</div>
		
<!-- End Chat Format -->

    
    </div>
    <div class="one-third last">

    <div class="clear"></div>
    <hr />
    
    <!-- Begin Form -->
		<div id="comment-form" class="comment-form">
		
			<div id="respond">
						<h3 id="reply-title">Leave a Comment</h3>
												
							<p class="comment-form-comment">
								<label for="comment">Comment</label>
								<textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea>
							</p>
							<p class="button-row">
								<button name="Submit" value="submit" onclick="createCommentSeverlet();">Submit</button>
							</p>
			</div><!-- #respond -->	
	  	
		</div>
		<!-- End Form -->	
    
    </div>
    



<script type="text/javascript" src="style/js/scripts.js"></script>
</body>
</html>