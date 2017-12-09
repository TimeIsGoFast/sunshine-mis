<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
 <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/static/images/title.jpg" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/static/css/cssReset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/liuyan.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
    <title>留言</title>
</head>
<body id="body">
 <%@include file="/WEB-INF/jsp/common/list.jsp"%>
<div class="liuyan">
    <p class="p1">写下你要留言的话</p>

        <textarea class="neirong" name="str" id="neirong"></textarea>
        <a href="#" onclick="submitMessage()">
        <div class="submit1">
            <p>发布</p>
        </div>
        </a>
</div>
<div class="daohang">
    <ul>
        <li><a href="#">全部</a></li>
        <!-- <li><a href="#">我的留言</a></li> -->
    </ul>

</div>
<div class="box" id="box">
  <p class="p1">内容</p>
  <%-- <div class="center">
      <img src="${pageContext.request.contextPath }/static/images/za9_img.jpg">
      <div class="wenzi">
          <p class="name">小曾的明天</p>
          <p class="time">2017-05-10 08:30</p>
          <p class="text">代码的时候，往往要去查字典。因为取一个好的变量名或者类名，有助于后期代码的维护。所以就想自己也做一个在线翻译的功能</p>
      </div>

  </div>
    <div class="pinglun">
        <button class="pinglun_button" >评论<span>12</span></button>
        <div class="text"></div>
    </div>


    <div class="center">
        <img src="${pageContext.request.contextPath }/static/images/za9_img.jpg">
        <div class="wenzi">
            <p class="name">小曾的明天</p>
            <p class="time">2017-05-10 08:30</p>
            <p class="text">代码的时候，往往要去查字典。因为取一个好的变量名或者类名，有助于后期代码的维护。所以就想自己也做一个在线翻译的功能</p>
        </div>

    </div>
    <div class="pinglun"><button class="pinglun_button" >评论<span>12</span></button></div> --%>
</div>
<div class="loading" id="load1">
<div class="div1">
  <img src="${pageContext.request.contextPath }/static/images/load.gif">
  <div style="float:left;margin:3px;">正在加载中，请稍后...</div>
</div>  
</div>
<div class="loading" id="load2" style="display:none;">
<div class="div1">
  <div style="float:left;margin:3px;"> &nbsp;&nbsp;&nbsp;&nbsp;已全部加载</div>
</div>  
</div>
</body>
<script>
 $(document).ready(function(){
	 initMessage(1,10);
	 
	
 });
 var page =1;
 var rows =10;
 $(window).scroll(function () {
	    if ($(document).scrollTop() + $(window).height() >= $(document).height()) {
	    	page++;	       
	        initMessage(page,rows);
	        
	    }
	});
 
 //展示消息列表
 function initMessage(page,rows){
	 var str;
	 $.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/anon/message/showMessage.do',
		data:{'page':page,'rows':rows},
		dataType:'json',
		success:function(data){
			if(data.length==0){
				$("#load1").hide();
				$("#load2").show();
			}
			 $.each(data, function (i, item) { 
				 var img = item.headimg;
				 if(img==""){
					 img="defult.JPG";
					 
				 }
				 $("#box").append('<div class="center">'+
					      '<img src="${pageContext.request.contextPath }/upload/touxiang/'+item.headimg+'">'+
					      '<div class="wenzi">'+
					          '<p class="name">'+item.name+'</p>'+
					          '<p class="time">'+item.time+'</p>'+
					          '<p class="text">'+item.content+'</p>'+
					      '</div>'+

					  '</div>'+
					      '<div class="pinglun">'+
				        '<button class="pinglun_button" ></button>'+
				        '<div class="text"></div>'+
				    '</div>'
						);
		        });  
			

		},
		error:function(){
		   alert("请求失败");
		},
		 
	 });
	 
	 
 }
 
 
 function submitMessage(){
	 var str = $("#neirong").val();
	if(str==""){
		alert("留言不能为空！");
		return;
	}
	 $.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/anon/message/addMessage.do',
			data:{'content':str},
			dataType:'json',
			success:function(data){
				var info=parseInt(data);
				if(info==2){
					window.location.href='${pageContext.request.contextPath }/renderLogin.do';
				}
				if(info==1){
					window.location.reload(); 
				}
				if(info==0){
					alert("留言失败!");
				}

			},
			error:function(){
			   alert("请求失败");
			},
			 
		 });
		 
	
 }

</script>
</html>