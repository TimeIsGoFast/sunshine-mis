<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>sunshine</title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath }/static/images/title.jpg" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/static/css/cssReset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/index.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/mplayer.css">
    <title>主页</title>
</head>
<body>
  <div class="header">
      <div class="center">
      <ul>
          <li>
              <a href="${pageContext.request.contextPath }/index.do">首页</a>
          </li>
          <li>
              <a href="${pageContext.request.contextPath }/anon/translation.do">在线翻译</a>
          </li>
          <li>
              <a href="${pageContext.request.contextPath }/anon/suibi/render.do">随笔</a>
          </li>
          <li>
              <a href="${pageContext.request.contextPath }/anon/forgetBook/showForgetBook.do">备忘录</a>
          </li>
          <li>
              <a href="${pageContext.request.contextPath }/anon/game.do">小游戏</a>
          </li>
          <li>
              <a href="${pageContext.request.contextPath }/anon/liuyan.do">留言</a>
          </li>
          <li>
              <a href="${pageContext.request.contextPath }/anon/tuling/render.do">聊天机器人</a>
          </li>
      </ul>
          <div class="login">
              <ul>
                 <c:if test="${ !empty user.name }">
                   <li><a href="${pageContext.request.contextPath }/anon/perfectInfo/render.do" target="_blank">${user.name}</a></li>
                    <li><a href="${pageContext.request.contextPath }/logout.do">退出</a></li>
                 </c:if>
                 <c:if test="${empty user.name }">
                 <li><a href="${pageContext.request.contextPath }/renderLogin.do">登录</a></li>
                 </c:if>
                 
              </ul>
          </div>

      </div>

  </div>
<div class="message">
    <img src="${pageContext.request.contextPath }/static/images/logo1.png">
   <p class="p1">HONG CHEN LIN WILL BE HAPPY</p>
   <p class="p2">SUNSHINE</p>
</div>

<div class="images">
   <ul class="slider">
       <li><img src="${pageContext.request.contextPath }/static/images/steam6.jpg"></li>
       <li><img src="${pageContext.request.contextPath }/static/images/steam1.jpg"></li>
       <li><img src="${pageContext.request.contextPath }/static/images/steam3.jpg"></li>
       <li><img src="${pageContext.request.contextPath }/static/images/steam4.jpg"></li>
       <li><img src="${pageContext.request.contextPath }/static/images/steam5.jpg"></li>
       <li><img src="${pageContext.request.contextPath }/static/images/steam6.jpg"></li>
       <li><img src="${pageContext.request.contextPath }/static/images/steam1.jpg"></li>
   </ul>
</div>
<div class="images_btn">
    <ul class="btn">
        <li class="current"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>

<div class="description">
  <div class="left">
<img src="${pageContext.request.contextPath }/static/images/haitun2.png">
  </div>
  <div class="right">
   <p class="p1">白夜行</p>
      <p class="p2">我的天空里没有太阳，总是黑夜，但并不暗，因为有东西代替了太阳。虽然没有太阳那么明亮，但对我来说已经足够。凭借着这份光，我便能把黑夜当成白天。我从来就没有太阳，所以不怕失去。<br> 世上有两样东西不可直视，一是太阳，二是人心。<br>​曾经拥有的东西被夺走，并不代表就会回到原来没有那种东西的时候。​​​</p>
  </div>
</div>

<div class="contain1">
   <div class="left">
       <div class="title">
           <p>为什么要做这个网站？</p>
       </div>
       <div class="neirong">
       <p>
           马上大四了，转眼间大学生活都快结束了。回想大学的点点滴滴，有时候需要有容器来存储它，才不至于没有回忆。回忆有时就想一杯淡茶，虽然平淡。却能滋润我们的生活。作为计算机专业的学生，所以就打算自己来做这个容器。把所学的发挥出来。也给自己一份美好的回忆！
       </p>
       </div>
   </div>
   <div class="right">
       <div class="title">
           <p>我的一点点期望！</p>
       </div>
       <div class="neirong">
           <p>
               刚开始，我想做个自己用的网站，一方面锻炼一下自己的代码能力，一方法也做想做一件让自己骄傲的事。后来我想，能不能所有人都可以用我的东西，虽然这个不现实，现在微博、微信、空间的功能已经很完善。但我清楚，只要有一个人用这个网站，那都是有意义的！
           </p>
       </div>
   </div>
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

  <div class="mp">
      <div class="mp-box">
          <img src="img/mplayer_error.png" alt="music cover" class="mp-cover">
          <div class="mp-info">
              <p class="mp-name">歌名</p>
              <p class="mp-singer">歌手</p>
              <p><span class="mp-time-current">00:00</span>/<span class="mp-time-all">00:00</span></p>
          </div>
          <div class="mp-btn">
              <button class="mp-prev" title="上一首"></button>
              <button class="mp-pause" title="播放"></button>
              <button class="mp-next" title="下一首"></button>
              <button class="mp-mode" title="播放模式"></button>
              <div class="mp-vol">
                  <button class="mp-vol-img" title="静音"></button>
                  <div class="mp-vol-range" data-range_min="0" data-range_max="100" data-cur_min="80">
                      <div class="mp-vol-current"></div>
                      <div class="mp-vol-circle"></div>
                  </div>
              </div>
          </div>
          <div class="mp-pro">
              <div class="mp-pro-current"></div>
          </div>
          <div class="mp-menu">
              <button class="mp-list-toggle"></button>
              <button class="mp-lrc-toggle"></button>
          </div>
      </div>
      <button class="mp-toggle">
          <span class="mp-toggle-img"></span>
      </button>
      <div class="mp-lrc-box">
          <ul class="mp-lrc"></ul>
      </div>
      <button class="mp-lrc-close"></button>
      <div class="mp-list-box">
          <ul class="mp-list-title"></ul>
          <table class="mp-list-table">
              <thead>
              <tr>
                  <th>歌名</th>
                  <th>歌手</th>
                  <th>时长</th>
              </tr>
              </thead>
              <tbody class="mp-list"></tbody>
          </table>
      </div>
  </div>

</body>

<script src="${pageContext.request.contextPath }/static/js/index.js"></script>
<script src="${pageContext.request.contextPath }/static/js/mplayer.js"></script>
<script src="${pageContext.request.contextPath }/static/js/mplayer-list.js"></script>
<script src="${pageContext.request.contextPath }/static/js/mplayer-functions.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.nstSlider.js"></script>
<script>
    var modeText = ['顺序播放','单曲循环','随机播放','列表循环'];
    var player = new MPlayer({
        // 容器选择器名称
        containerSelector: '.mp',
        // 播放列表
        songList: mplayer_song,
        // 专辑图片错误时显示的图片
        defaultImg: 'img/mplayer_error.png',
        // 自动播放
        autoPlay: true,
        // 播放模式(0->顺序播放,1->单曲循环,2->随机播放,3->列表循环(默认))
        playMode:0,
        playList:0,
        playSong:0,
        // 当前歌词距离顶部的距离
        lrcTopPos: 34,
        // 列表模板，用${变量名}$插入模板变量
        listFormat: '<tr><td>#{name}$</td><td>#{singer}$</td><td>#{time}$</td></tr>',
        // 音量滑块改变事件名称
        volSlideEventName:'change',
        // 初始音量
        defaultVolume:80
    }, function () {
        // 绑定事件
        this.on('afterInit', function () {
            console.log('播放器初始化完成，正在准备播放');
        }).on('beforePlay', function () {
            var $this = this;
            var song = $this.getCurrentSong(true);
            var songName = song.name + ' - ' + song.singer;
            console.log('即将播放'+songName+'，return false;可以取消播放');
        }).on('timeUpdate', function () {
            var $this = this;
            console.log('当前歌词：' + $this.getLrc());
        }).on('end', function () {
            var $this = this;
            var song = $this.getCurrentSong(true);
            var songName = song.name + ' - ' + song.singer;
            console.log(songName+'播放完毕，return false;可以取消播放下一曲');
        }).on('mute', function () {
            var status = this.getIsMuted() ? '已静音' : '未静音';
            console.log('当前静音状态：' + status);
        }).on('changeMode', function () {
            var $this = this;
            var mode = modeText[$this.getPlayMode()];
            $this.dom.container.find('.mp-mode').attr('title',mode);
            console.log('播放模式已切换为：' + mode);
        });
    });


    $(document.body).append(player.audio); // 测试用

    setEffects(player);
    
    function addsong(){
        alert("开始");
       var _datas={
           "name":"袖手旁观",
           "singer":"张碧晨",
           "img":"http://y.gtimg.cn/music/photo_new/T002R300x300M000003rsKF44GyaSk.jpg?max_age=2592000",
           "src":"music/xhpg.mp3",
           "lrc":"[ti:袖手旁观]"
       };
       player.addSong(_datas);
   }

</script>
</html>