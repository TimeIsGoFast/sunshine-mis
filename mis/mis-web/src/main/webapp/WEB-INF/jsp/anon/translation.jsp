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
    <link href="${pageContext.request.contextPath }/static/css/translation.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
    <title>在线翻译</title>
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
        <p>我们在写代码的时候，往往要去查字典。因为取一个好的变量名或者类名，有助于后期代码的维护。所以就想自己也做一个在线翻译的功能。虽然比不上百度翻译和有道翻译（我平常用的就是有道翻译）,我想我会用自己写的东西，有一种自豪感（虽然比不上正规的翻译网站！）如果觉得不好用的话可以点击去下面两个网站！</p>
        <p class="p1"><a href="http://fanyi.baidu.com/?aldtype=16047#auto/zh" target="_blank">百度翻译</a>&nbsp;   &nbsp;    &nbsp;   &nbsp;  &nbsp;  &nbsp;<a href="http://fanyi.youdao.com/" target="_blank">有道翻译</a></p>
    </div>

</div>
<p class="game_center"><span> 小&nbsp;太&nbsp;阳&nbsp;翻&nbsp;译 </span></p>
<div class="fanyi">
   <div class="left">
     <textarea id="textarea1" class="textareaStyle"  placeholder="输入文字，即可翻译。"></textarea>
   </div>
    <div class="right">

        <p class="p1" id="_src"></p>
        <p class="p2" id="_dst"></p>
    </div>

</div>
<div class="bottom3">
    <div class="button1">
        <p>自动检测</p>
    </div>
    <div class="p1">&nbsp;&rarr;&nbsp;</div>
    <div class="button2">
       <select id="transto">
           <option value="en">英文</option>
           <option value="zh">中文</option>
           <option value="yue">粤语</option>
           <option value="wyw">文言文</option>
           <option value="jp">日语</option>
           <option value="kor">韩语</option>
           <option value="fra">法语</option>
           <option value="spa">西班牙语</option>
           <option value="th">泰语</option>
           <option value="ara">阿拉伯语</option>
           <option value="ru">俄语</option>
           <option value="pt">葡萄牙语</option>
           <option value="de">德语</option>
           <option value="it">意大利语</option>
           <option value="el">希腊语</option>
           <option value="nl">荷兰语</option>
           <option value="pl">波兰语</option>
           <option value="bul">保加利亚语</option>
           <option value="est">爱沙尼亚语</option>
           <option value="dan">丹麦语</option>
           <option value="fin">芬兰语</option>
           <option value="cs">捷克语</option>
           <option value="rom">罗马尼亚语</option>
           <option value="slo">斯洛文尼亚语</option>
           <option value="swe">瑞典语</option>
           <option value="hu">匈牙利语</option>
           <option value="cht">繁体中文</option>
           <option value="vie">越南语</option>

       </select>
    </div>
<a  onclick="_translate()">
    <div class="button3">
         <p> 在线翻译</p>
    </div>
</a>
</div>
<div id="footAnimation" class="bottom">
    <img id="wave3" class="footerWave" src="${pageContext.request.contextPath }/static/images/hl.png">
    <img id="dood" class="footerDood" src="${pageContext.request.contextPath }/static/images/ren.png">
    <img id="wave2" class="footerWave" src="${pageContext.request.contextPath }/static/images/hailang2.png">
    <img id="whale" class="footerWhale" src="${pageContext.request.contextPath }/static/images/haitun1.png">
    <img id="wave1" class="footerWave" src="${pageContext.request.contextPath }/static/images/hailang3.png">

</div>
<div class="bottom2">

</div>
</body>

<script src="${pageContext.request.contextPath }/static/js/md5.js"></script>
<script>
    var appid = '20170609000056722';
    var key = '8GY7IFMrVk02hTSu7EP_';


    function _translate(){

        var salt = (new Date).getTime();
        var query = $("#textarea1").val();
        var from = 'auto';
        var to = $("#transto").val();

        var str1 = appid + query + salt +key;
        var sign = MD5(str1);


        $.ajax({
            url: 'http://api.fanyi.baidu.com/api/trans/vip/translate',
            type: 'get',
            dataType: 'jsonp',
            data: {
                q: query,
                appid: appid,
                salt: salt,
                from: from,
                to: to,
                sign: sign
            },
            success: function (data) {
                console.log(data);
                var dst =data.trans_result[0].dst;
               $("#_dst").text(dst);

                $("#_src").text(query);
            }
        });
    }

</script>
</html>