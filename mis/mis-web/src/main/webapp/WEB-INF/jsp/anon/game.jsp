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
    <link href="${pageContext.request.contextPath }/static/css/game.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
    <title>小游戏</title>
</head>
<body>
 <%@include file="/WEB-INF/jsp/common/list.jsp"%>
<div class="message">
    <img src="${pageContext.request.contextPath }/static/images/logo1.png">
    <p class="p1">PLAYING GAMES MAKES US HAPPY</p>
    <p class="p2">SUNSHINE</p>
</div>
<div class="description">
    <div class="left">
           <img src="${pageContext.request.contextPath }/static/images/game.png">
    </div>
    <div class="right">
        <p>我的理解：加入这个游戏模块是为了让网站变得更加的有意思点，在闲暇之余玩会游戏可以让我们更加放松，更加快乐。也符合这个网站的主题。希望大家有空多玩玩里面的游戏。<br>刚开始的时候，可能里面的小游戏不是很多，但后期肯定会添加更多好玩的游戏！也希望多留言，多提宝贵的意见，使这个网站更加的完善！</p>
    </div>

</div>
<p class="game_center"><span>- 游&nbsp;戏&nbsp;中&nbsp;心 -</span></p>
<div class="game_detail">
    <a href="${pageContext.request.contextPath }/anon/game1.do" target="_blank">
    <div class="game1">
        <div class="title">
            <p>2048</p>
        </div>
        <div class="neirong">
            <p>
                4x4的网格搭配上浅灰色的背景，显得更加的简洁朴素。不同数字不一样的背景颜色，让你知道谁才是永远的主角。在时刻提醒着你，2048才是你的目的，其它的都是浮云。
            </p>
        </div>
    </div>
    </a>
    <a href="${pageContext.request.contextPath }/anon/guoguan.do" target="_blank">
    <div class="game1">
        <div class="title">
            <p>过关游戏</p>
        </div>
        <div class="neirong">
            <p>
                通过游戏的过关容易让人感到满足感！从而从内心里感到快乐！
            </p>
        </div>
    </div>
    </a>


    <div class="game1">
        <div class="title">
            <p>后期添加</p>
        </div>
        <div class="neirong">
            <p>
                后期添加游戏！期待！
            </p>
        </div>
    </div>

</div>



</body>
</html>