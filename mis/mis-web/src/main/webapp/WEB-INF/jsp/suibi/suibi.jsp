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
    <link href="${pageContext.request.contextPath }/static/css/suibi.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/default.css" />
       <link href="${pageContext.request.contextPath }/static/layer/default/layer.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/layer/layer.js"></script>
    <title>随笔</title>
</head>
<body>
  <%@include file="/WEB-INF/jsp/common/list.jsp"%>
<div class="message">
    <img src="${pageContext.request.contextPath }/static/images/logo1.png">
    <p class="p1">GOOD GOOD STUDY DAY DAY UP</p>
    <p class="p2">SUNSHINE</p>
</div>
<div class="description">
    <div class="left">
        <img src="${pageContext.request.contextPath }/static/images/thranslation.png">
    </div>
    <div class="right">
        <p>记下今天所发生的事，记录自己一闪而过的灵感。当你回过头来看到，也许有那么一丝丝的庆幸、一丝的感动！随笔功能暂时不支持表情和图片上传，主要是怕到时候服务器压力太大！希望能够理解，多谢支持！</p>
    </div>

</div>

<div class="edit">

<form >
    <p class="p1">文章标题</p>
    <div class="title"><input type="text" name="title" id="title"></div>
    <p class="p2">文章内容</p>
    <textarea name="content" id="_content" style="width:1000px;height:400px;visibility:hidden;"></textarea>
    <input type="button" value="提交" class="button1" onclick="submitForm()">
</form>
</div>
<div>


</div>
<div id="box">
<%-- <div class="box" id="">
    <p class="p1">内容</p>
    <div class="center">
        <img src="${pageContext.request.contextPath }/static/images/za9_img.jpg">
        <div class="wenzi">
            <p class="time">2017-05-10 08:30</p>
            <p class="text">代码的时候，往往要去查字典。因为取一个好的变量名或者类名，有助于后期代码的维护。所以就想自己也做一个在线翻译的功能</p>
        </div>

    </div>
    <div class="pinglun">
        <p class="p1"><a href="#" >查看详情</a>&nbsp;   &nbsp;    &nbsp;   &nbsp;  &nbsp;  &nbsp;<a href="#">删除</a></p>
    </div>
    <div class="detail">

    </div>
</div> --%>
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
<script charset="utf-8" src="${pageContext.request.contextPath }/static/js/kindeditor-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath }/static/js/zh_CN.js"></script>

<script>
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="content"]', {
            resizeType : 1,
            allowPreviewEmoticons : false,
            allowImageUpload : false,
            items : [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
    });
    
    //新增留言
    function submitForm(){
    	var title=$("#title").val();
    	var content=editor.html();
    	  
    	
    	if(title==""){
    		layer.msg('标题不能为空', {time: 2000, icon:6});
    		return;
    	}
    	if(content==""){
    		layer.msg('内容不能为空', {time: 2000, icon:6});
    		return;
    	}
    	$.ajax({
    		type:'post',
    		url:'${pageContext.request.contextPath }/anon/suibi/addSuibi.do',
    		data:{'title':title,'content':content},
    		dataType:'json',
    		success:function(data){
    			var info = parseInt(data);
    			if(info==1){
    				window.location.reload(); 
    			}else{
    				
    				layer.alert('添加失败！', {
    					  icon: 5,
    					  skin: 'layer-ext-moon' 
    					})
    			}
    			
    		},
    		error:function(){
    			layer.alert('请求服务器失败！', {
					  icon: 5,
					  skin: 'layer-ext-moon' 
					})
    		}
    		
    	});
    	
    	
    	
    }
    
    //展示列表
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
		url:'${pageContext.request.contextPath }/anon/suibi/showMessage.do',
		data:{'page':page,'rows':rows},
		dataType:'json',
		success:function(data){
			if(data.length==0){
				$("#load1").hide();
				$("#load2").show();
			}
			$.each(data,function(i,item){
				var _id="_box"+item.id;
				$("#box").append(
						'<div class="box" >'+
					    '<p class="p1">内容</p>'+
					    '<div class="center">'+
					        '<img src="${pageContext.request.contextPath }/upload/touxiang/'+str+'">'+
					        '<div class="wenzi">'+
					            '<p class="time">'+item.time+'</p>'+
					            '<p class="text">'+item.title+'</p>'+
					        '</div>'+

					    '</div>'+
					    '<div class="pinglun">'+
				        '<p ><a   onclick="_detail('+item.id+')">查看详情</a>&nbsp;   &nbsp;    &nbsp;   &nbsp;  &nbsp;  &nbsp;<a onclick="delSuibi('+data[i].id+')">删除</a></p>'+
				    '</div>'+
				    '<div class="detail" id='+_id+' style="display:none;">'+
				    item.content+
				    '</div>'+
				    '</div>'
				);
			});
			
			for(var i=0;i<=data.length;i++){
			
				
			}

		},
		error:function(){
			layer.alert('请求服务器失败！', {
				  icon: 5,
				  skin: 'layer-ext-moon' 
				})
		},
		 
	 });
	 
	 
 }
 //查看详情功能
function _detail(id){
	$("#_box"+id).show();
	/* $.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/anon/suibi/getDetail.do',
		data:{'id':id},
		dataType:'json',
		success:function(data){
			$("#_box"+id).append(
					'<div class="detail">'+
                       data.content+
				    '</div>'
			)
		
		},
		error:function(){
			layer.alert('请求服务器失败！', {
				  icon: 5,
				  skin: 'layer-ext-moon' 
				})
		},
	}); */
	 
 }
 
 //删除随笔功能
 function delSuibi(id){
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
			url:'${pageContext.request.contextPath }/anon/suibi/delSuibi.do',
			data:{'id':id},
			dataType:'json',
			success:function(data){
				var info = parseInt(data);
				if(info==1){
					window.location.reload(); 
				}
				if(info==0){
					layer.alert('删除失败！', {
						  icon: 5,
						  skin: 'layer-ext-moon' 
						})
				}
			},
			error:function(){
				layer.alert('请求服务器失败！', {
					  icon: 5,
					  skin: 'layer-ext-moon' 
					})
			},
		 });
 }

 
</script>
</html>