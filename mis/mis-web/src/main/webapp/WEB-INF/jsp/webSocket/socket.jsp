<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <input type="text" id="text" /><br>
  <button onclick= "sendMessage()">发送</button>
  
  
</body>
<script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
<script>
var socketPath='${basePath}';
var webSocket = new WebSocket("ws://"+socketPath+"/ws");
webSocket.onopen = function(event){
    console.log("连接成功");
    console.log(event);
};
webSocket.onerror = function(event){
    console.log("连接失败");
    console.log(event);
};
webSocket.onclose = function(event){
    console.log("Socket连接断开");
    console.log(event);
};
webSocket.onmessage = function(event){
    //接受来自服务器的消息
    //...
    var message = JSON.parse(event.data);//将数据解析成JSON形式
    console.log(message);
}

function sendMessage(){
	var data = {};//新建data对象，并规定属性名与相应的值
    data['fromId'] = 1;
    data['fromName'] = "zeng";
    data['toId'] = 84;
    data['messageText'] = $("#text").val();
    webSocket.send(JSON.stringify(data));//将对象封装成JSON后发送至服务器
	
}

</script>
</html>