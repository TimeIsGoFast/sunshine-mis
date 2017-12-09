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
    <link href="${pageContext.request.contextPath }/static/css/forgetbook.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath }/static/layer/default/layer.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/layer/layer.js"></script>
    <title>备忘录</title>
</head>
<body>
  <%@include file="/WEB-INF/jsp/common/list.jsp"%>
<div class="liuyan">
    <p class="p1">添加备忘录</p>

    <textarea class="neirong" name="str" id="neirong"></textarea>
    <a href="#"  onclick="submitMessage()">
    <div class="submit1">
        <p>提交</p>
    </div>
  </a>
</div>
<div id="box">

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
	 $("#load1").hide();
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
	 var str = '${headimg}';
	 if(str==""){
		 str="defult.JPG";
	 }
	 
	 $.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/anon/forgetBook/showMessage.do',
		data:{'page':page,'rows':rows},
		dataType:'json',
		success:function(data){
			if(data.length==0){
				$("#load1").hide();
				$("#load2").show();
			}
			$.each(data,function(i,item){
				$("#box").append(
						'<div class="box">'+
					    '<p class="p1">我的备忘录</p>'+
					    '<div class="center">'+
					        '<img src="${pageContext.request.contextPath }/upload/touxiang/'+str+'">'+
					        '<div class="wenzi">'+
					            '<p class="time">'+item.time+'</p>'+
					            '<p class="text">'+item.content+'</p>'+
					        '</div>'+

					    '</div>'+
					    '<div class="pinglun">'+
				        '<p >&nbsp;   &nbsp;    &nbsp;   &nbsp;  &nbsp;  &nbsp;<a href="#" onclick="delForgetBook('+item.id+')">删除</a></p>'+
				    '</div>'+
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
	
		layer.msg('输入内容不能为空', {icon: 1});
		return;
	}
	 $.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/anon/forgetBook/addMessage.do',
			data:{'content':str},
			dataType:'json',
			success:function(data){
				var info=parseInt(data);
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
 
 //删除操作
 function delForgetBook(id){
	 layer.confirm('您确定要删除吗？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			_delForgetBook(id);
		}, function(){
			layer.close(layer.index);
		});
	 
	
 }
 
 function _delForgetBook(id){
	 $.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/anon/forgetBook/delForgetBook.do',
			data:{'id':id},
			dataType:'json',
			success:function(data){
				var info = parseInt(data);
				if(info==1){
					window.location.reload(); 
				}
				if(info==0){
					alert("删除失败!");
				}
			},
			error:function(){
				
			},
		 });
 }

</script>
</html>