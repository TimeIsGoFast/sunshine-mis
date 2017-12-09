<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/static/images/title.jpg" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/static/css/cssReset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/talk.css" rel="stylesheet">
 
   
    <title>聊天机器人</title>

</head>
<body>

<%@include file="/WEB-INF/jsp/common/list.jsp"%>
<div class="message">
    <img src="${pageContext.request.contextPath }/static/images/logo1.png">
    <p class="p1">PLASE TALK WITH ME SOMETIMES</p>
    <p class="p2">SUNSHINE</p>
</div>
<div id="container" class="container">

    <div class="left">
      <img src="${pageContext.request.contextPath }/static/images/icon40.png">
        <p class="p2">sunshine</p>
        <p class="p1">聊天对话 问答百科</p>
        <p class="p1">生活百科 &nbsp;知识库</p>
        <p class="p1">星座运势 新闻资讯</p>
        <p class="p1">成语接龙 故事大全</p>
        <p class="p1">菜谱大全 快递查询</p>
        <p class="p1">笑话大全 天气查询</p>
        <p class="p1">图片搜索 列车查询</p>
        <p class="p1">航班查询  数字计算</p>
        <p class="p1">日期查询 吉凶查询</p>



    </div>

    <div class="right">
     <div class="headers">
         <p>&nbsp;&nbsp;&nbsp;图灵机器人</p>
     </div>

    <ul class="content" id="_content">
        <li></li>
    </ul>
    <div class="footer">

        <textarea id="text" class="_textarea" placeholder="enter键换行，ctrl+enter键发送"></textarea>
        <button id="btn">发送 S</button>
    </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
<script>
    window.onload = function(){
        var arrIcon = ['${pageContext.request.contextPath }/static/images/icon.JPG','${pageContext.request.contextPath }/static/images/icon40.png'];
        var num = 0;     //控制头像改变
        var iNow = -1;    //用来累加改变左右浮动

        var btn = document.getElementById('btn');
        var text = document.getElementById('text');
        var content = document.getElementById('_content');
        var img = content.getElementsByTagName('img');
        var span = content.getElementsByTagName('span');

   /*     icon[0].onclick = function(){
            if(num==0){
                this.src = arrIcon[1];
                num = 1;
            }else if(num==1){
                this.src = arrIcon[0];
                num = 0;
            }
        }*/
        btn.onclick = function(){
        	talkwith();
        }
        
        document.onkeydown=function(event){
        	              var e = event || window.event || arguments.callee.caller.arguments[0];
        	                 
        	              if(event.ctrlKey&&e.keyCode==13){ // enter 键
        	            	  talkwith();
        	             }
        	      }; 
        
        function talkwith(){
            if(text.value ==''){
            	
            }else {
            	num=0;
                content.innerHTML += '<li><img class="imgright" src="'+arrIcon[num]+'"><span class="spanright">'+text.value+'</span></li>';
             
                content.scrollTop=content.scrollHeight;
                // 内容过多时,将滚动条放置到最底端
               
            }
            
            var value= $("#text").val();
        	var key = "85f709726f104a7cb84603b521ab0bd0";
        	var userid = '${uid}';
        	if(userid==""){
        		userid=12345678;
        	}
        	
        	$.ajax({
        		type:'post',
        		url:'http://www.tuling123.com/openapi/api',
        		data:{'key':key,'info':value,'userid':userid},
        		dataType:'json',
        		success:function(data){
        			eventDetail(data);
        		},
        		error:function(){
        			layer.msg('请求失败', {icon: 6});
        		},
        	});
        	text.value = '';
        	
        }
        
        //各种事件的处理
        
        function eventDetail(data){
        	//文本类
        	if(data.code==100000){
        		num=1;
    			content.innerHTML += '<li><img class="imgleft" src="'+arrIcon[num]+'"><span class="spanleft">'+data.text+'</span></li>';
    			content.scrollTop=content.scrollHeight;
        		
        	}else if(data.code==200000){
        		//链接类
        		num=1;
    			content.innerHTML += '<li><img class="imgleft" src="'+arrIcon[num]+'"><span class="spanleft">'+data.text+'</span></li>';
    			content.innerHTML += '<li><img class="imgleft" src="'+arrIcon[num]+'"><span class="spanleft"><a href="'+data.url+'" target="_blank">点击查看</a></span></li>';
    			content.scrollTop=content.scrollHeight;
        		
        	}else if(data.code==302000){
        		//新闻类
        		
        	}else if(data.code==308000){
        		//菜谱类
        		console.log(data);
        		
        	}else{
        		num=1;
    			content.innerHTML += '<li><img class="imgleft" src="'+arrIcon[num]+'"><span class="spanleft">'+data.text+'</span></li>';
    			content.scrollTop=content.scrollHeight;
        	}
        	
        	
        	
        	
        	
        }
        
    }
    
    
    //执行
    
</script>
</html>
