<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/static/images/title.jpg" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/2048.css">
<title>过关小游戏</title>
<style type="text/css">
* { margin:0; padding:0; }
#canvas { display:block; margin:10px auto; border:1px solid #bbb; outline:none; }
.box { position:relative; }
</style>
<script src="${pageContext.request.contextPath }/static/js/jquery-2.1.1.min.js"></script>
</head>

<body>
<div style="width: 100%;margin: 60px;"></div>
<h1 class="_titlle">过关小游戏</h1>
	<div class="box" >
    	<canvas id="canvas" tabindex="0"></canvas>
    </div>

<script type="text/javascript">

$(document).ready(function(e) {
    var canvas = document.getElementById("canvas");
	var ctx = canvas.getContext("2d");
	var c = $("#canvas");
	var cur = c.css('cursor');
	var w = 600, h = 600, dx = 0, dy = 0, x = 0, y = 0;
	var x2 = x;
	var y2 = y;
	var w2 = w/2;
	var h2 = h/2;
	var mf = [w2,h2];
	var fadewh = 0;
	var le = 1;
	var lea = 30;
	var tle = le;
	var lv = '';
	var mr = 20;
	var mr2 = mr/2;
	var start = true, fade = false, level1 = false, lev = false, mov = false, choose = false, pause = false;
	var kaishisize = '20px';
	var tm = 1;
	var ya = [];
	var chu = [];
	var bu = [];
	var yd = [];
	var bd = [];
	var yc = [];
	var ly = [];
	var yq = [];
	var zb = [];
	var bc = [];
	var lt = [];
	var th = [];
	var cs = [];
	var cd = [];
	var ty = [];
	var hb = [];
	var zz = [];
	var v = 0;
	var a = .2;
	var mxl = 0, mxr = 0;
	var xv = 2;
	var sv = -7;
	var sx = 0;
	var sy = 0;
	var sx2 = 0;
	var sy2 = 0;
	var xa = 0;
	var xaj = .2;
	var bingf = 1;
	var pi2 = Math.PI/2;
	var jian = false;
	var kong = false;
	var isStart = true;
	var ov = false;
	var nanc = false;
	var fa = 10;
	var yi = true;
	var dkong = false;
	var choosestyle = '#fff';
	var menustyle = '#999';
	var restyle = '#999';
	var tingstyle = '#999';
	var backstyle = '#fff'; 
	var cox = 100, coy = 100, cow = 60, coh = 30, coxk = 85, coyk = 40;
	var coy2 = coy;
	var cox2 = cox;
	var cohang = 0;
	var choo = [];
	canvas.width = w;
	canvas.height = h;
	ctx.fillStyle = '#000';
	ctx.fillRect(0,0,w,h);
	function begin(){
		ctx.fillStyle = '#fff';
		ctx.fillRect(0,0,w,h);
		if(start)toStart();
		if(choose)toChoose();
		if(level1)toLevel1();
		if(lev)toLev();
		if(mov)move();
		if(ov)over();
		if(fade)toFade();
		if(pause)toPause();
		if(isStart)window.requestAnimationFrame(begin);
	}
	c.mousemove(function(e){
		dx = e.pageX - c.offset().left - parseInt(c.css('border-left-width'));
		dy = e.pageY - c.offset().top - parseInt(c.css('border-top-width'));
		mm();
	});
	function mm(){
		if(start){
			if(dx >= 250 && dx <= 350 && dy >= 288 && dy <= 318){
				kaishisize = '22px';
				c.css('cursor','pointer');
			}else if(dx >= 270 && dx <= 330 && dy >= 362 && dy <= 386){
				c.css('cursor','pointer');
				choosestyle = '#000';
			}
			else{
				kaishisize = '20px';
				choosestyle = '#fff';
				c.css('cursor',cur);
			}
		}
		if(choose && choo.length){
			if(dx >= 270 && dx <= 330 && dy >= 482 && dy <= 506){
				backstyle = '#000';
				c.css('cursor','pointer');
			}else{
				backstyle = "#fff";
				for(var i=0;i<lea;i++){
					if(dx >= choo[i].x && dx <= choo[i].x+cow && dy >= choo[i].y && dy <= choo[i].y+coh){
						choo[i].c = "#000";
						c.css('cursor','pointer');
						break;
					}else{
						choo[i].c = "#fff";
						c.css('cursor',cur);
					}
				}
			}
		}
		if(level1){
			if(dx >= 560 && dx <= 590 && dy >= 10 && dy <= 35){
				menustyle = '#bbb';
				c.css('cursor','pointer');
			}else if(dx >= 520 && dx <= 540 && dy >= 12 && dy <= 32){
				restyle = '#bbb';
				c.css('cursor','pointer');
			}else if(dx >= 478 && dx <= 502 && dy >= 9 && dy <= 37){
				tingstyle = '#bbb';
				c.css('cursor','pointer');
			}else{
				menustyle = '#999';
				restyle = '#999';
				tingstyle = '#999';
				c.css('cursor',cur);
			}
		}
		if(pause){
			if(Math.sqrt(Math.pow(dx-300,2)+Math.pow(dy-300,2)) <= 100){
				c.css('cursor','pointer');
			}else{
				c.css('cursor',cur);
			}
		}
	}
	c.click(function(){
		if(start){
			if(dx >= 250 && dx <= 350 && dy >= 288 && dy <= 318){
				start = false;
				kaishisize = '20px';
				c.css('cursor',cur);
				fade = true;
			}else if(dx >= 270 && dx <= 330 && dy >= 362 && dy <= 386){
				start = false;
				kaishisize = '20px';
				choosestyle = '#fff';
				c.css('cursor',cur);
				choose = true;
			}
		}
		if(choose && choo.length){
			for(var i=0;i<lea;i++){
				if(dx >= choo[i].x && dx <= choo[i].x+cow && dy >= choo[i].y && dy <= choo[i].y+coh){
					le = i+1;
					c.css('cursor',cur);
					fade = true;
					choose = false;
					break;
				}
			}
			if(dx >= 270 && dx <= 330 && dy >= 482 && dy <= 506){
				choose = false;
				start = true;
			}
		}
		if(level1){
			if(dx >= 560 && dx <= 590 && dy >= 10 && dy <= 35){
				start = true;
				mov = false;
				level1 = false;
				lev = false;
				le = 1;
				tle = 1;
			}else if(dx >= 520 && dx <= 540 && dy >= 12 && dy <= 32){
				xuan();
			}else if(dx >= 478 && dx <= 502 && dy >= 9 && dy <= 37){
				isStart = false;
				pause = true;
			}
		}
		if(pause){
			if(Math.sqrt(Math.pow(dx-300,2)+Math.pow(dy-300,2)) <= 100){
				isStart = true;
				pause = false;
				level1 = true;
				mov = true;
				begin();
			}
		}
	});
	function toPause(){
		level1 = false;
		mov = false;
		ctx.fillStyle = 'rgba(0,0,0,.5)';
		ctx.fillRect(0,0,w,h);
		ctx.beginPath();
		ctx.fillStyle = '#000';
		ctx.arc(300,300,100,0,4*pi2);
		ctx.closePath();
		ctx.fill();
		ctx.beginPath();
		ctx.fillStyle = '#fff';
		ctx.arc(300,300,96,0,4*pi2);
		ctx.closePath();
		ctx.fill();
		ctx.beginPath();
		ctx.fillStyle = '#000';
		ctx.moveTo(370,300);
		ctx.lineTo(250,230);
		ctx.lineTo(250,370);
		ctx.closePath();
		ctx.fill();
	}
	function toChoose(){
		ctx.fillStyle = '#999';
		ctx.fillRect(0,0,w,h);
		for(var i=0;i<lea;i++){
			if(!choo[i]){
				choo[i] = {};
			}
			choo[i].x = cox+(cohang*coxk);
			choo[i].y = coy;
			ctx.beginPath();
			ctx.strokeStyle = choo[i].c ||'#fff';
			ctx.strokeRect(cox+(cohang*coxk),coy,cow,coh);
			ctx.closePath();
			ctx.fillStyle = choo[i].c ||'#fff';
			ctx.font = '16px 微软雅黑';
			ctx.fillText(i+1, cox+(cohang*coxk)+cow/2,coy+coh*2/3);
			cohang++;
			if((i+1)%5 == 0 && i != 1){
				coy+=coyk
				cox = cox2;
				cohang = 0;
			}
		}
		ctx.fillStyle = backstyle;
		ctx.font = '16px 微软雅黑';
		ctx.fillText('返回',300,500);
		ctx.beginPath();
		ctx.strokeStyle = backstyle;
		ctx.strokeRect(270,482,60,24);
		ctx.closePath();
		coy = coy2;
		cox = cox2;
		cohang = 0;
	}
	function toStart(){
		ctx.fillStyle = '#999';
		ctx.fillRect(0,0,w,h);
		ctx.font = kaishisize+' 微软雅黑';
		ctx.fillStyle = '#fff';
		ctx.textAlign = 'center';
		ctx.fillText("开始游戏", 300, 310);
		ctx.fillStyle = choosestyle;
		ctx.font = '16px 微软雅黑';
		ctx.fillText("选关", 300, 380);
		ctx.beginPath();
		ctx.strokeStyle = '#fff';
		ctx.strokeRect(250,288,100,30);
		ctx.closePath();
		ctx.beginPath();
		ctx.strokeStyle = choosestyle;
		ctx.strokeRect(270,362,60,24);
		ctx.closePath();
	}
	function toFade(){
		ctx.fillStyle = '#fff';
		ctx.fillRect(0,0,w,h);
		if(tle != 1){
			if(yi){
				fadewh = Math.max.apply(null, mf) - fa;
				fa*=-1;
				yi = false;
			}
			if(fadewh <= 0)fa*=-1;
			fadewh += fa;
		}else{
			fadewh += fa;
		}
		ctx.fillStyle = '#999';
		ctx.fillRect(0-fadewh,0-fadewh,w2,h2);
		ctx.fillRect(w2+fadewh,0-fadewh,w2,h2);
		ctx.fillRect(0-fadewh,h2+fadewh,w2,h2);
		ctx.fillRect(w2+fadewh,h2+fadewh,w2,h2);
		if(fadewh >= w2 && fadewh >= h2){
			yi = true;
			fadewh = 0;
			xuan();
		}
	}
	function xuan(){
		fade = false;
		lev = true;
		level1 = true;
		mov = true;
		ya = [];
		chu = [];
		bu = [];
		bd = []; 
		yd = []; // 移动
		bc = [];
		yc = []; // 隐藏
		ly = []; // 全屏
		yq = []; // 圆圈
		zb = []; // 钟摆
		lt = []; // 落体
		th = []; // 弹簧
		cs = []; // 传送
		cd = []; // 传送带
		ty = []; // 跳跃
		hb = []; // 滑冰
		zz = []; // 沼泽
		tm = 1;
		v = 0;
		lv = le;
		if(le == 0){
			/*ya[1] = [200,400,200,10];
			bu.push([450,400,50,10]);
			yd.push([101,300,200,10,'x',100,300,4,1,0,.2]); // [7].最大速度 [8] 方向 [9] 随意 [10]最小速度 [10]>=[7]时匀速
			bd.push([101,250,50,30,'x',100,450,3,1,0,2]);
			yc.push([200,400,200,10,.05,5,1,false]); // [4]隐藏速度 [5]隐藏后多久出来 后面固定值
			ly.push([40,40,40,40,4,3]); // [4]x+ [5]y+ 
			yq.push([300,300,100,40,40,1,pi2,0.03]);  // 中心 半径 方块宽高 正反 初始位置 速度
			zb.push([500,300,100,20,20,-1,pi2+0.8,pi2+1,0.05,0.001]); // 中心 半径 方块宽高 正反 初始位置 最高位置 速度 最小速度
			bc.push([200,400,200,10,.01,1,1]); // [6]/[4]显示的时间  [5]/[4]隐藏的时间
			lt.push([0,-40,40,40,680,0.1,0.5,0,true]); // [4] 落体y距离  [5]加速度 [6]停留时间 [7]初始速度
			th.push([0,450,50,50,12,true]); // [4]速度
			cs.push([0,480,mr,mr,300,480,mr,mr,true]);
			cd.push([200,400,200,10,1,true]);
			ty.push([200,460,40,40,2,5,1,100,500,true]); // [4] x速度 [5] y速度 [6]方向 [x边距]
			hb.push([0,500,150,100,2]); 
			zz.push([250,400,100,10]); */
		}else if(le == 1){
			ya.push([0,500,200,100]);
			ya.push([200,400,200,200]);
			ya.push([400,300,200,300]);
			chu = [560,280,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 2){
			ya.push([0,500,250,100]);
			ya.push([350,500,250,100]);
			chu = [500,480,mr,mr];
			x = 100;
			y = 400;
		}else if(le == 3){
			ya.push([0,500,w,100]);
			bu.push([290,100,20,400]);
			th.push([240,460,40,40,12.5,true]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 4){
			hb.push([0,500,150,100,2]);
			hb.push([290,500,20,100,2]);
			hb.push([450,500,600,100,2]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 5){
			ya.push([0,500,200,100]);
			ya.push([500,300,100,10]);
			yc.push([200,400,40,10,.05,5,1,false]);
			yc.push([300,400,40,10,.05,5,1,false]);
			yc.push([400,400,40,10,.05,5,1,false]);
			chu = [560,280,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 6){
			ya.push([0,500,100,100]);
			zz.push([200,500,500,100]);
			bu.push([300,460,40,40]);
			bu.push([440,460,40,40]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 7){
			ya.push([0,500,100,100]);
			ya.push([500,400,100,10]);
			cd.push([200,500,100,10,1.5,true]);
			cd.push([360,500,100,10,-1.5,true]);
			chu = [560,380,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 8){
			ya.push([0,500,w,100]);
			bu.push([200,420,40,80]);
			bu.push([400,420,40,80]);
			chu = [500,480,mr,mr];
			x = 100;
			y = 400;
		}else if(le == 9){
			ya.push([0,500,w,100]);
			ty.push([200,460,40,40,2,5,1,100,500,true]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 10){
			ya.push([0,500,100,100]);
			ya.push([500,500,100,100]);
			hb.push([200,500,150,10,4]); 
			bu.push([350,440,30,70]);
			cd.push([380,500,100,10,-1.5,true]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 11){
			ya.push([100,0,300,h]);
			ya.push([0,500,100,10]);
			ya.push([400,500,200,10]);
			ya.push([400,400,200,10]);
			cs.push([80,480,mr,mr,400,480,mr,mr,true]);
			cs.push([580,480,mr,mr,400,380,mr,mr,true]);
			zb.push([500,405,80,20,20,-1,pi2+0.8,pi2+1,0.06,0.002]);
			chu = [560,380,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 12){
			ya.push([0,500,100,100]);
			ya.push([500,500,100,100]);
			th.push([60,460,40,40,12,true]);
			hb.push([100,100,400,10,5]);
			bu.push([100,0,400,10]);
			ty.push([240,60,40,40,2,4,1,240,358,true]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 13){
			ya.push([0,500,100,100]);
			ya.push([500,500,100,100]);
			yd.push([201,400,50,10,'x',100,250,4,-1,0,1]);
			cd.push([380,400,100,10,-1.8,true]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 14){
			ya.push([0,550,50,50]);
			ya.push([50,500,150,100]);
			ya.push([250,500,400,200]);
			ya.push([200,550,50,50]);
			bd.push([0,260,400,200,'y',200,300,3,-1,0,1]);
			bd.push([450,260,150,200,'y',200,300,3,-1,0,1]);
			bd.push([400,260,50,150,'y',200,300,3,-1,0,1]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 520;
		}else if(le == 15){
			ya.push([0,500,100,100]);
			hb.push([100,500,100,100,7]);
			ya.push([200,500,100,100]);
			lt.push([145,-10,10,10,620,0,0,15,true]);
			cd.push([300,500,200,10,4,true]);
			ya.push([500,500,100,10]);
			bu.push([480,460,40,40]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 16){
			ya.push([0,500,170,100]);
			ya.push([300,500,200,100]);
			ya.push([500,100,100,10]);
			th.push([460,460,40,40,12,true]);
			bd.push([450,250,20,20,'x',400,500,3,1,0,2]);
			chu = [560,80,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 17){
			ya.push([0,500,150,10]);
			ya.push([280,500,100,10]);
			ya.push([510,500,90,10]);
			ya.push([0,200,100,10]);
			cd.push([230,200,100,10,1,true]);
			ya.push([460,200,140,10]);
			zb.push([270,205,240,80,80,-1,pi2+0.8,pi2+1,0.05,0.001]);
			cs.push([580,480,mr,mr,0,180,mr,mr,true]);
			chu = [560,180,mr,mr];
			x = 40;
			y = 400;
		}else if(le == 18){
			ya.push([0,500,100,100]);
			ya.push([500,500,100,100]);
			yd.push([201,400,50,10,'x',100,260,3,-1,0,1.5]);
			yd.push([301,400,50,10,'x',300,450,4,1,0,3]);
			chu = [560,480,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 19){
			ya.push([0,500,100,100]);
			ya.push([500,100,100,10]);
			yd.push([201,400,50,10,'x',100,260,3,-1,0,1.5]);
			yd.push([400,400,50,10,'y',200,450,4,1,0,3]);
			chu = [560,80,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 20){
			ya.push([0,500,100,100]);
			ya.push([200,500,50,100]);
			ya.push([350,500,50,100]);
			ya.push([0,200,400,20]);
			bu.push([120,180,60,20]);
			bu.push([360,140,20,60]);
			yd.push([500,400,50,10,'y',200,550,4,1,0,3]);
			bd.push([140,450,20,20,'y',350,500,3,1,0,2]);
			bd.push([290,450,20,20,'y',350,500,4,1,0,1]);
			chu = [80,180,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 21){
			ya.push([0,500,w,100]);
			ya.push([0,300,500,10]);
			ya.push([550,400,50,10]);
			bd.push([200,480,20,20,'x',100,300,3,1,0,3]);
			bd.push([200,400,40,60,'x',100,300,4,1,0,4]);
			bd.push([400,480,20,20,'x',340,500,8,1,0,3]);
			bd.push([515,400,20,20,'y',240,440,5,1,0,3]);
			bd.push([200,260,40,40,'x',100,460,12,1,0,1]);
			chu = [20,280,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 22){
			ya.push([0,500,20,20]);
			ya.push([100,400,20,20]);
			ya.push([200,284,20,20]);
			ya.push([300,166,20,20]);
			ya.push([400,400,200,20]);
			bu.push([79,405,20,20]);
			bu.push([179,289,20,20]);
			bu.push([233,275,20,20]);
			bu.push([455,380,20,20]);
			bu.push([505,380,20,20]);
			chu = [480,380,mr,mr];
			x = 0;
			y = 400;
		}else if(le == 23){
			ya.push([0,300,100,10]);
			ya.push([200,300,50,10]);
			ya.push([350,300,50,10]);
			ya.push([500,300,100,10]);
			bu.push([60,280,30,20]);
			bu.push([210,280,30,20]);
			bu.push([360,280,30,20]);
			bu.push([525,280,20,20]);
			bu.push([575,280,20,20]);
			chu = [550,280,mr,mr];
			x = 20;
			y = 200;
		}else if(le == 24){
			ya.push([450,580,40,20]);
			ya.push([100,350,50,10]);
			ya.push([250,250,50,10]);
			ya.push([400,400,50,10]);
			yc.push([320,430,60,10,.05,5,1,false]);
			yd.push([20,401,60,10,'y',200,450,5,-1,0,3]);
			yd.push([170,401,60,10,'y',100,450,6,-1,0,6]);
			yd.push([500,501,50,10,'y',450,550,2,-1,0,.5]);
			bu.push([100,0,50,300]);
			bu.push([100,360,50,240]);
			bu.push([250,0,50,200]);
			bu.push([250,260,50,340]);
			bu.push([400,0,50,350]);
			bu.push([400,410,50,200]);
			bu.push( [550,410,50,200]);
			bu.push([450,410,50,50]);
			chu = [460,560,mr,mr];
			x = 40;
			y = 160;
		}else if(le == 25){
			ya.push([0,580,w,20]);
			ya.push([400,50,200,50]);
			bu.push([0,420,400,50]);
			bu.push([450,420,150,50]);
			bu.push([0,250,50,50]);
			bu.push([100,250,500,50]);
			bu.push([0,50,350,50]);
			yc.push([120,240,50,10,.05,5,1,false]);
			yc.push([180,160,50,10,.05,5,1,false]);
			yc.push([270,220,50,10,.05,5,1,false]);
			yd.push([400,500,50,10,'y',420,520,3,1,0,0.5]);
			yd.push([300,380,50,10,'x',120,340,3,1,0,2]);
			yd.push([50,300,50,10,'y',250,380,2,1,0,0.5]);
			yd.push([350,120,50,10,'y',100,200,2,1,0,0.5]);
			yq.push([475,75,50,20,20,-1,pi2,0.03]);
			chu = [560,30,mr,mr];
			x = 100;
			y = 540;
		}else if(le == 26){
			ya.push([0,500,100,100]);
			ya.push([0,100,500,10]);
			ya.push([550,200,50,10]);
			yc.push([150,400,50,10,.05,5,1,false]);
			yc.push([270,330,50,10,.05,5,1,false]);
			yc.push([400,260,50,10,.05,5,1,false]);
			yq.push([175,405,40,20,20,1,pi2,0.03]);
			yq.push([425,265,40,20,20,-1,pi2,0.05]);
			zb.push([200,0,80,40,40,-1,pi2+0.8,pi2+1,0.05,0.001]);
			lt.push([270,-50,50,50,700,0.1,0.5,0,true]);
			chu = [20,80,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 27){
			ya.push([0,500,100,100]);
			ya.push([150,480,50,10]);
			ya.push([250,460,50,10]);
			ya.push([350,440,50,10]);
			ya.push([450,420,50,10]);
			ya.push([550,400,50,10]);
			ya.push([550,300,50,10]);
			ya.push([550,200,50,10]);
			ya.push([450,180,50,10]);
			ya.push([350,160,50,10]);
			ya.push([250,140,50,10]);
			ya.push([150,120,50,10]);
			ya.push([0,100,100,10]);
			lt.push([115,-20,20,20,620,0.2,0.5,1,true]);
			lt.push([215,-20,20,20,620,0.5,1,1,true]);
			lt.push([315,-20,20,20,620,1,0,0,true]);
			lt.push([415,-20,20,20,620,0.1,1,3,true]);
			lt.push([500,-20,20,20,620,0.2,0.2,3,true]);
			lt.push([530,-20,20,20,620,0.1,0,5,true]);
			chu = [20,80,mr,mr];
			x = 20;
			y = 400;
		}else if(le == 28){
			ya.push([250,580,100,20]);
			ya.push([250,50,100,10]);
			yd.push([101,500,50,10,'x',100,450,2,1,0,2]);
			yd.push([300,400,40,10,'x',100,460,2.5,1,0,2.5]);
			yd.push([400,300,30,10,'x',100,470,3,-1,0,3]);
			yd.push([400,200,20,10,'x',100,480,4,1,0,4]);
			yc.push([200,100,20,10,.05,5,1,false]);
			yc.push([380,100,20,10,.05,5,1,false]);
			bu.push([200,480,20,20]);
			bu.push([380,480,20,20]);
			bu.push([280,380,20,20]);
			bu.push([180,280,20,20]);
			bu.push([420,280,20,20]);
			bu.push([100,140,60,60]);
			bu.push([440,140,60,60]);
			bd.push([225,60,20,20,'y',0,100,3,1,0,0.1]);
			bd.push([355,80,20,20,'y',0,100,2.5,-1,0,0.5]);
			chu = [290,30,mr,mr];
			x = 290;
			y = 540;
		}else if(le == 29){
			ya.push([400,500,200,100]);
			ya.push([380,400,160,10]);
			ya.push([360,300,180,10]);
			ya.push([340,200,200,10]);
			ya.push([100,100,440,10]);
			ya.push([280,200,10,400]);
			ya.push([530,100,10,400]);
			ya.push([100,100,10,410]);
			ya.push([150,200,130,10]);
			ya.push([150,300,130,10]);
			ya.push([150,400,130,10]);
			ya.push([150,500,130,10]);
			ya.push([110,450,130,10]);
			ya.push([110,350,130,10]);
			ya.push([110,250,130,10]);
			bc.push([540,400,60,60,.01,1,1]);
			yc.push([0,150,50,10,.05,5,1,false]);
			yc.push([0,250,50,10,.05,5,1,false]);
			yc.push([0,350,50,10,.05,5,1,false]);
			yc.push([0,450,50,10,.05,5,1,false]);
			yc.push([50,500,50,10,.05,5,1,false]);
			yc.push([50,400,50,10,.05,5,1,false]);
			yc.push([50,300,50,10,.05,5,1,false]);
			yc.push([50,200,50,10,.05,5,1,false]);
			yd.push([101,550,50,10,'x',0,200,3,1,0,2]);
			lt.push([170,-40,40,40,640,0.1,0.5,0,true]);
			zb.push([200,100,88,20,20,-1,pi2+0.8,pi2+1,0.05,0.003]);
			zb.push([400,0,78,40,40,1,pi2-0.8,pi2+1,0.1,0.002]);
			yq.push([225,455,40,10,10,1,pi2,0.05]);
			chu = [560,480,mr,mr];
			x = 440;
			y = 440;
		}else if(le == 30){
			ya.push([0,590,w,10]);
			ya.push([0,490,500,10]);
			ya.push([100,390,500,10]);
			ya.push([0,290,500,10]);
			ya.push([100,190,500,10]);
			ya.push([0,90,500,10]);
			yq.push([495,495,50,10,10,1,pi2,0.03]);
			yq.push([105,395,50,10,10,-1,pi2,0.05]);
			yq.push([495,295,50,10,10,1,pi2,0.07]);
			yq.push([105,195,50,10,10,-1,pi2,0.09]);
			yq.push([495,95,50,10,10,1,pi2,0.11]);
			bd.push([150,450,40,90,'y',400,500,4,1,0,.2]);
			bd.push([350,306,40,90,'y',300,400,5,1,0,.2]);
			bd.push([300,286,40,90,'y',200,300,2,1,0,1.5]);
			bd.push([200,86,40,90,'y',0,200,8,1,0,1.5]);
			bd.push([400,1,40,90,'y',0,100,2,1,0,1.5]);
			zb.push([300,0,68,40,40,-1,pi2+0.8,pi2+1,0.08,0.002]);
			ly.push([40,40,40,40,3,3]);
			chu = [20,70,mr,mr];
			x = 20;
			y = 560;
		}else{
			ov = true;
		}
		x2 = x;
		y2 = y;
	}
	function toLevel1(){
		ctx.fillStyle = '#999';
		for(var i=0;i<ya.length;i++){
			ctx.fillRect(ya[i][0],ya[i][1],ya[i][2],ya[i][3]);
		}
		ctx.fillStyle = '#B9CDF6';
		for(var i=0;i<hb.length;i++){
			ctx.fillRect(hb[i][0],hb[i][1],hb[i][2],hb[i][3]);
		}
		ctx.fillStyle = '#222';
		for(var i=0;i<zz.length;i++){
			ctx.fillRect(zz[i][0],zz[i][1],zz[i][2],zz[i][3]);
		}
		ctx.fillStyle = '#999';
		for(var i=0;i<yc.length;i++){
			if(yc[i][7]){
				yc[i][6]-=yc[i][4];
			}
			if(yc[i][6] < -yc[i][5]){
				yc[i][6] = 1;
				yc[i][7] = false;
			}
			if(yc[i][6] >= 0 ){
				ctx.fillStyle = 'rgba(205,198,115,'+yc[i][6]+')';
				ctx.fillRect(yc[i][0],yc[i][1],yc[i][2],yc[i][3]);
			}
		}
		for(var i=0;i<cd.length;i++){
			ctx.fillStyle = '#cdb5cd';
			ctx.fillRect(cd[i][0],cd[i][1],cd[i][2],cd[i][3]);
			ctx.fillStyle = '#ad85ad';
			if(cd[i][4]>=0){
				if(cd[i][5]){
					cd[i][5]=false;
					cd[i][6]=cd[i][0];
					cd[i][7]=cd[i][0]+(cd[i][2]/2);
					cd[i][8]=cd[i][2]/4;
				}
				cd[i][6]+=cd[i][4];
				cd[i][7]+=cd[i][4];
				if(cd[i][6]>=cd[i][0]+(cd[i][2]/2)){
					cd[i][6]=cd[i][0];
					cd[i][7]=cd[i][0]+(cd[i][2]/2);
				}
				if(cd[i][7]>cd[i][0]+(3*cd[i][2]/4)){
					cd[i][8] = cd[i][0]+cd[i][2]-cd[i][7];
					ctx.fillRect(cd[i][0],cd[i][1],(cd[i][2]/4)-cd[i][8],5);
				}else{
					cd[i][8] = cd[i][2]/4;
				}
				ctx.fillRect(cd[i][6],cd[i][1],cd[i][2]/4,5);
				ctx.fillRect(cd[i][7],cd[i][1],cd[i][8],5);
			}else{
				if(cd[i][5]){
					cd[i][5]=false;
					cd[i][6]=cd[i][0]+cd[i][2]/4;
					cd[i][7]=cd[i][0]+(3*cd[i][2]/4);
					cd[i][8]=cd[i][2]/4;
				}
				cd[i][6]+=cd[i][4];
				cd[i][7]+=cd[i][4];
				if(cd[i][7]<=cd[i][0]+cd[i][2]/4){
					cd[i][6]=cd[i][0]+cd[i][2]/4;
					cd[i][7]=cd[i][0]+(3*cd[i][2]/4);
				}
				if(cd[i][6]<cd[i][0]){
					cd[i][6] = cd[i][0];
					cd[i][8]+=cd[i][4];
					ctx.fillRect(cd[i][0]+(3*cd[i][2]/4)+cd[i][8],cd[i][1],cd[i][2]/4-cd[i][8],5);
				}else{
					cd[i][8]=cd[i][2]/4;
				}
				ctx.fillRect(cd[i][6],cd[i][1],cd[i][8],5);
				ctx.fillRect(cd[i][7],cd[i][1],cd[i][2]/4,5);
			}
		}
		ctx.fillStyle = '#8ad';
		for(var i=0;i<th.length;i++){
			if(th[i][5]){
				th[i][5] = false;
				th[i][6] = th[i][3];
				th[i][7] = th[i][1];
				th[i][8] = true;
			}
			ctx.fillRect(th[i][0],th[i][1],th[i][2],10);
			ctx.fillRect(th[i][0],th[i][1]+th[i][3]-10,th[i][2],10);
			ctx.strokeStyle = '#999';
			ctx.lineWidth = 2;
			ctx.lineCap = 'round';
			ctx.beginPath();
			ctx.moveTo(th[i][0]+5,th[i][1]+5);
			ctx.lineTo(th[i][0]+th[i][2]-5,th[i][1]+th[i][3]-5);
			ctx.stroke();
			ctx.closePath();
			ctx.beginPath();
			ctx.moveTo(th[i][0]+5,th[i][1]+th[i][3]-5);
			ctx.lineTo(th[i][0]+th[i][2]-5,th[i][1]+5);
			ctx.stroke();
			ctx.closePath();
		}
		for(var i=0;i<cs.length;i++){
			ctx.lineWidth = 2;
			ctx.strokeStyle = '#F08080';
			ctx.strokeRect(cs[i][0],cs[i][1],cs[i][2],cs[i][3]);
			ctx.strokeRect(cs[i][4],cs[i][5],cs[i][6],cs[i][7]);
			ctx.font = '14px 微软雅黑';
			ctx.fillStyle = '#F08080';
			ctx.fillText(i+1, cs[i][0]+10, cs[i][1]+16);
			ctx.fillText(i+1, cs[i][4]+10, cs[i][5]+16);
		}
		ctx.fillStyle = '#d08';
		for(var i=0;i<bu.length;i++){
			ctx.fillRect(bu[i][0],bu[i][1],bu[i][2],bu[i][3]);
		}
		for(var i=0;i<bc.length;i++){
			bc[i][6]-=bc[i][4];
			if(bc[i][6] < -bc[i][5]){
				bc[i][6] = 1;
			}
			if(bc[i][6] > 0){
				ctx.fillRect(bc[i][0],bc[i][1],bc[i][2],bc[i][3]);
			}
		}
		for(var i=0;i<yq.length;i++){
			yq[i][6]+=yq[i][7]*yq[i][5];
			yq[i][8] = yq[i][0]+(yq[i][2]*Math.cos(yq[i][6]))-(yq[i][3]/2);
			yq[i][9] = yq[i][1]+(yq[i][2]*Math.sin(yq[i][6]))-(yq[i][4]/2);
			ctx.fillRect(yq[i][8],yq[i][9],yq[i][3],yq[i][4]);
		}
		for(var i=0;i<zb.length;i++){
			zb[i][10] = Math.abs((Math.abs(zb[i][6]-pi2)-Math.abs(zb[i][7] - pi2))*zb[i][8])/Math.abs(zb[i][7] - pi2);
			if(zb[i][10]<=zb[i][9]){
				zb[i][10] = zb[i][9];
			}
			if(Math.abs(zb[i][6]-pi2)>=Math.abs(zb[i][7]-pi2)){
				zb[i][5]*=-1;
			}
			zb[i][6]+=zb[i][10]*zb[i][5];
			zb[i][11] = zb[i][0]+(zb[i][2]*Math.cos(zb[i][6]))-(zb[i][3]/2);
			zb[i][12] = zb[i][1]+(zb[i][2]*Math.sin(zb[i][6]))-(zb[i][4]/2);
			ctx.fillRect(zb[i][11],zb[i][12],zb[i][3],zb[i][4]);
			ctx.beginPath();
			ctx.strokeStyle = '#999';
			ctx.lineWidth = (zb[i][3]+zb[i][4])/20;
			ctx.lineCap = 'round';
			ctx.moveTo(zb[i][0],zb[i][1]);
			ctx.lineTo(zb[i][0]+(zb[i][2]*Math.cos(zb[i][6])),zb[i][1]+(zb[i][2]*Math.sin(zb[i][6])));
			ctx.stroke();
			ctx.closePath();
		}
		for(var i=0;i<ly.length;i++){
			ly[i][0]+=ly[i][4];
			ly[i][1]+=ly[i][5];
			if(ly[i][0] < 0){
				ly[i][0]*=-1;
				ly[i][4]*=-1;
			}else if(ly[i][0]+ly[i][2] > w){
				ly[i][0] = 2*(w-ly[i][2]) - ly[i][0];
				ly[i][4]*=-1;
			}
			if(ly[i][1] < 0){
				ly[i][1]*=-1;
				ly[i][5]*=-1;
			}else if(ly[i][1]+ly[i][3] > h){
				ly[i][1] = 2*(h-ly[i][3]) - ly[i][1];
				ly[i][5]*=-1;
			}
			ctx.fillRect(ly[i][0],ly[i][1],ly[i][2],ly[i][3]);
		}
		ctx.fillStyle = '#999';
		for(var i=0;i<yd.length;i++){
			if(yd[i][4] == 'x'){
				yd[i][9] = yd[i][7]*yd[i][8]*Math.min.apply(null, [yd[i][6]-yd[i][0],yd[i][0]-yd[i][5]])/(yd[i][6]-yd[i][5]);
				if(Math.abs(yd[i][9]) <= yd[i][10])yd[i][9]=yd[i][10]*yd[i][8];
				if(yd[i][0]+yd[i][9] >= yd[i][6] || yd[i][0]+yd[i][9] <= yd[i][5])yd[i][8]*=-1;
				yd[i][11] = yd[i][0];
				yd[i][0]+=yd[i][9];
				ctx.fillRect(yd[i][0],yd[i][1],yd[i][2],yd[i][3]);
			}else{
				yd[i][9] = yd[i][7]*yd[i][8]*Math.min.apply(null, [yd[i][6]-yd[i][1],yd[i][1]-yd[i][5]])/(yd[i][6]-yd[i][5]);
				if(Math.abs(yd[i][9]) <= yd[i][10])yd[i][9]=yd[i][10]*yd[i][8];
				if(yd[i][1]+yd[i][9] >= yd[i][6] || yd[i][1]+yd[i][9] <= yd[i][5])yd[i][8]*=-1;
				yd[i][11] = yd[i][1];
				yd[i][1]+=yd[i][9];
				ctx.fillRect(yd[i][0],yd[i][1],yd[i][2],yd[i][3]);
			}
		}
		ctx.fillStyle = '#d08';
		for(var i=0;i<ty.length;i++){
			if(ty[i][9]){
				ty[i][9] = false;
				ty[i][10] = ty[i][1];
				ty[i][11]=-1*ty[i][5];
			}
			ty[i][0]+=(ty[i][4]*ty[i][6]);
			ty[i][11]+=a;
			ty[i][1]+=ty[i][11];
			if(ty[i][1]>=ty[i][10]){
				ty[i][1] = ty[i][10];
				ty[i][11]=-1*ty[i][5];
			}
			if(ty[i][0]<=ty[i][7]){
				ty[i][6]*=-1;
				ty[i][0] = 2*ty[i][7]-ty[i][0];
			}else if(ty[i][0]+ty[i][2]>=ty[i][8]){
				ty[i][6]*=-1;
				ty[i][0] = 2*(ty[i][8]-ty[i][2])-ty[i][0];
			}
			ctx.fillRect(ty[i][0],ty[i][1],ty[i][2],ty[i][3]);
		}
		for(var i=0;i<lt.length;i++){
			if(lt[i][8]){
				lt[i][8] = false;
				lt[i][9] = lt[i][1];
				lt[i][10] = lt[i][7];
				lt[i][11] = lt[i][6];
			}
			lt[i][6]-=0.01;
			if(lt[i][6]<=0){
				lt[i][7]+=lt[i][5];
				lt[i][1]+=lt[i][7];
			}
			if(lt[i][1]+lt[i][3]>lt[i][4]){
				lt[i][1] = lt[i][9];
				lt[i][7] = lt[i][10];
				lt[i][6] = lt[i][11];
			}
			ctx.fillRect(lt[i][0],lt[i][1],lt[i][2],lt[i][3]);
		}
		for(var i=0;i<bd.length;i++){
			if(bd[i][4] == 'x'){
				bd[i][9] = bd[i][7]*bd[i][8]*Math.min.apply(null, [bd[i][6]-bd[i][0],bd[i][0]-bd[i][5]])/(bd[i][6]-bd[i][5]);
				if(Math.abs(bd[i][9]) <= bd[i][10])bd[i][9]=bd[i][10]*bd[i][8];
				if(bd[i][0]+bd[i][9] >= bd[i][6] || bd[i][0]+bd[i][9] <= bd[i][5])bd[i][8]*=-1;
				bd[i][11] = bd[i][0];
				bd[i][0]+=bd[i][9];
				ctx.fillRect(bd[i][0],bd[i][1],bd[i][2],bd[i][3]);
			}else{
				bd[i][9] = bd[i][7]*bd[i][8]*Math.min.apply(null, [bd[i][6]-bd[i][1],bd[i][1]-bd[i][5]])/(bd[i][6]-bd[i][5]);
				if(Math.abs(bd[i][9]) <= bd[i][10])bd[i][9]=bd[i][10]*bd[i][8];
				if(bd[i][1]+bd[i][9] >= bd[i][6] || bd[i][1]+bd[i][9] <= bd[i][5])bd[i][8]*=-1;
				bd[i][11] = bd[i][1];
				bd[i][1]+=bd[i][9];
				ctx.fillRect(bd[i][0],bd[i][1],bd[i][2],bd[i][3]);
			}
		}
		ctx.lineWidth = 2;
		ctx.strokeStyle = '#32CD32';
		ctx.strokeRect(chu[0],chu[1],chu[2],chu[3]);
		/*if(le == 1){
			ctx.font = '14px 微软雅黑';
			ctx.fillStyle = '#32CD32';
			ctx.fillText("出口", 510, 480);
			ctx.fillStyle = '#d08';
			ctx.fillText("不能碰", 475, 390);
		};*/
	}
	function toLev(){
		tm-=.01;
		ctx.fillStyle = 'rgba(34,136,221,'+tm+')';
		ctx.font = '30px 微软雅黑';
		ctx.textAlign = 'center';
		ctx.fillText("第 "+lv+" 关", 300, 310);
		if(tm <= 0){
			tm = 1;
			lev = false;
		}
	}
	function move(){
		sx = x;
		sy = y;
		if(mxl && !mxr){
			x-=mxl;
			bingf = -1;
		}else if(!mxl && mxr){
			x+=mxr;
			bingf = 1;
		}
		if(x < 0){
			x = 0;
		}else if(x+mr > w){
			x = w-mr;
		}
		kong = true;
		dkong = true;
		for(var i=0;i<ya.length;i++){
			if(sx+mr <= ya[i][0] && x+mr >= ya[i][0] && y+mr > ya[i][1] && y <= ya[i][1]+ya[i][3]){
				x = ya[i][0]-mr;
			}else if(sx >= ya[i][0]+ya[i][2] && x <= ya[i][0]+ya[i][2] && y+mr > ya[i][1] && y <= ya[i][1]+ya[i][3]){
				x = ya[i][0]+ya[i][2];
			}
			if(x+mr > ya[i][0] && x < ya[i][2]+ya[i][0] && parseInt(y+mr) <= ya[i][1] && parseInt(y+mr+v) >= ya[i][1]){
				v = 0;
				y = ya[i][1]-mr;
			}else if(x+mr > ya[i][0] && x < ya[i][2]+ya[i][0] && parseInt(y) > ya[i][1]+ya[i][3] && parseInt(y+v) <= ya[i][1]+ya[i][3]){
				v = 0;
				y = ya[i][1]+ya[i][3];
			}
			if(y == ya[i][1]-mr && v != sv){
				if(x+mr <= ya[i][0] || x >= ya[i][2]+ya[i][0]){
					kong = true;
				}else{
					v = 0;
					kong = false;
					if(jian)v = sv;
				}
			}
			if(!kong)dkong = false;
		}
		for(var i=0;i<zz.length;i++){
			if(sx+mr <= zz[i][0] && x+mr >= zz[i][0] && y+mr > zz[i][1] && y <= zz[i][1]+zz[i][3]){
				x = zz[i][0]-mr;
			}else if(sx >= zz[i][0]+zz[i][2] && x <= zz[i][0]+zz[i][2] && y+mr > zz[i][1] && y <= zz[i][1]+zz[i][3]){
				x = zz[i][0]+zz[i][2];
			}
			if(x+mr > zz[i][0] && x < zz[i][2]+zz[i][0] && parseInt(y+mr) <= zz[i][1] && parseInt(y+mr+v) >= zz[i][1]){
				v = 0;
				y = zz[i][1]-mr;
			}else if(x+mr > zz[i][0] && x < zz[i][2]+zz[i][0] && parseInt(y) > zz[i][1]+zz[i][3] && parseInt(y+v) <= zz[i][1]+zz[i][3]){
				v = 0;
				y = zz[i][1]+zz[i][3];
			}
			if(y == zz[i][1]-mr && v != sv){
				if(x+mr <= zz[i][0] || x >= zz[i][2]+zz[i][0]){
					kong = true;
				}else{
					v = 0;
					kong = false;
					if(jian)v = sv;
					x = sx;
				}
			}
			if(!kong)dkong = false;
		}
		for(var i=0;i<hb.length;i++){
			if(sx+mr <= hb[i][0] && x+mr >= hb[i][0] && y+mr > hb[i][1] && y <= hb[i][1]+hb[i][3]){
				x = hb[i][0]-mr;
			}else if(sx >= hb[i][0]+hb[i][2] && x <= hb[i][0]+hb[i][2] && y+mr > hb[i][1] && y <= hb[i][1]+hb[i][3]){
				x = hb[i][0]+hb[i][2];
			}
			if(x+mr > hb[i][0] && x < hb[i][2]+hb[i][0] && parseInt(y+mr) <= hb[i][1] && parseInt(y+mr+v) >= hb[i][1]){
				v = 0;
				y = hb[i][1]-mr;
			}else if(x+mr > hb[i][0] && x < hb[i][2]+hb[i][0] && parseInt(y) > hb[i][1]+hb[i][3] && parseInt(y+v) <= hb[i][1]+hb[i][3]){
				v = 0;
				y = hb[i][1]+hb[i][3];
			}
			if(y == hb[i][1]-mr && v != sv){
				if(x+mr <= hb[i][0] || x >= hb[i][2]+hb[i][0]){
					kong = true;
				}else{
					v = 0;
					kong = false;
					if(jian)v = sv;
					x = sx + (hb[i][4]*bingf);
					if(x < 0){
						x = 0;
					}else if(x+mr > w){
						x = w-mr;
					}
				}
			}
			if(!kong)dkong = false;
		}
		for(var i=0;i<cd.length;i++){
			if(sx+mr <= cd[i][0] && x+mr >= cd[i][0] && y+mr > cd[i][1] && y <= cd[i][1]+cd[i][3]){
				x = cd[i][0]-mr;
			}else if(sx >= cd[i][0]+cd[i][2] && x <= cd[i][0]+cd[i][2] && y+mr > cd[i][1] && y <= cd[i][1]+cd[i][3]){
				x = cd[i][0]+cd[i][2];
			}
			if(x+mr > cd[i][0] && x < cd[i][2]+cd[i][0] && parseInt(y+mr) <= cd[i][1] && parseInt(y+mr+v) >= cd[i][1]){
				v = 0;
				y = cd[i][1]-mr;
			}else if(x+mr > cd[i][0] && x < cd[i][2]+cd[i][0] && parseInt(y) > cd[i][1]+cd[i][3] && parseInt(y+v) <= cd[i][1]+cd[i][3]){
				v = 0;
				y = cd[i][1]+cd[i][3];
			}
			if(y == cd[i][1]-mr && v != sv){
				if(x+mr <= cd[i][0] || x >= cd[i][2]+cd[i][0]){
					kong = true;
				}else{
					x+=cd[i][4];
					v = 0;
					kong = false;
					if(jian)v = sv;
				}
			}
			if(!kong)dkong = false;
		}
		for(var i=0;i<th.length;i++){
			if(sx+mr <= th[i][0] && x+mr >= th[i][0] && y+mr > th[i][1] && y <= th[i][1]+th[i][3]){
				x = th[i][0]-mr;
			}else if(sx >= th[i][0]+th[i][2] && x <= th[i][0]+th[i][2] && y+mr > th[i][1] && y <= th[i][1]+th[i][3]){
				x = th[i][0]+th[i][2];
			}
			if(x+mr > th[i][0] && x < th[i][2]+th[i][0] && parseInt(y+mr) <= th[i][1] && parseInt(y+mr+v) >= th[i][1]){
				v = 0;
				y = th[i][1]-mr;
			}else if(x+mr > th[i][0] && x < th[i][2]+th[i][0] && parseInt(y) > th[i][1]+th[i][3] && parseInt(y+v) <= th[i][1]+th[i][3]){
				v = 0;
				y = th[i][1]+th[i][3];
			}
			if(y == th[i][1]-mr && v != sv){
				if(x+mr <= th[i][0] || x >= th[i][2]+th[i][0]){
					kong = true;
				}else{
					if(th[i][3]>=21 && th[i][8]){
						th[i][1]+=1;
						th[i][3]-=1;
						y = th[i][1]-mr;
					}else{
						if(th[i][3]-10>=th[i][6]){
							th[i][3] = th[i][6];
							th[i][1] = th[i][7];
							y = th[i][1]-mr;
							v = -th[i][4];
							th[i][8] = true;
						}else{
							th[i][1]-=10;
							th[i][3]+=10;
							y = th[i][1]-mr;
							v = 0;
							th[i][8] = false;
						}
					}
					kong = false;
					if(jian)v = sv;
				}
			}else{
				if(th[i][3]+10>=th[i][6]){
					th[i][3] = th[i][6];
					th[i][1] = th[i][7];
				}else{
					th[i][1]-=10;
					th[i][3]+=10;
				}
			}
			if(!kong)dkong = false;
		}
		for(var i=0;i<yc.length;i++){
			if(yc[i][6] >= 0){
				if(sx+mr <= yc[i][0] && x+mr >= yc[i][0] && y+mr > yc[i][1] && y <= yc[i][1]+yc[i][3]){
					x = yc[i][0]-mr;
				}else if(sx >= yc[i][0]+yc[i][2] && x <= yc[i][0]+yc[i][2] && y+mr > yc[i][1] && y <= yc[i][1]+yc[i][3]){
					x = yc[i][0]+yc[i][2];
				}
				if(x+mr > yc[i][0] && x < yc[i][2]+yc[i][0] && parseInt(y+mr) <= yc[i][1] && parseInt(y+mr+v) >= yc[i][1]){
					v = 0;
					y = yc[i][1]-mr;
					yc[i][7] = true;
				}else if(x+mr > yc[i][0] && x < yc[i][2]+yc[i][0] && parseInt(y) > yc[i][1]+yc[i][3] && parseInt(y+v) <= yc[i][1]+yc[i][3]){
					v = 0;
					y = yc[i][1]+yc[i][3];
				}
				if(y == yc[i][1]-mr && v != sv){
					if(x+mr <= yc[i][0] || x >= yc[i][2]+yc[i][0]){
						kong = true;
					}else{
						v = 0;
						kong = false;
						if(jian)v = sv;
					}
				}
				if(!kong)dkong = false;
			}
		}
		for(var i=0;i<yd.length;i++){
			if(yd[i][4] == 'x'){
				if(sx+mr <= yd[i][11] && x+mr >= yd[i][0] && y+mr > yd[i][1] && y <= yd[i][1]+yd[i][3]){
					x = yd[i][0]-mr;
				}else if(sx >= yd[i][11]+yd[i][2] && x <= yd[i][0]+yd[i][2] && y+mr > yd[i][1] && y <= yd[i][1]+yd[i][3]){
					x = yd[i][0]+yd[i][2];
				}
				if(x+mr > yd[i][0] && x < yd[i][2]+yd[i][0] && parseInt(y+mr) <= yd[i][1] && parseInt(y+mr+v) >= yd[i][1]){
					v = 0;
					y = yd[i][1]-mr;
				}else if(x+mr > yd[i][0] && x < yd[i][2]+yd[i][0] && parseInt(y) > yd[i][1]+yd[i][3] && parseInt(y+v) <= yd[i][1]+yd[i][3]){
					v = 0;
					y = yd[i][1]+yd[i][3];
				}
				if(y == yd[i][1]-mr && v != sv){
					if(x+mr <= yd[i][0] || x >= yd[i][2]+yd[i][0]){
						kong = true;
					}else{
						x-=(yd[i][11]-yd[i][0]);
						v = 0;
						kong = false;
						if(jian)v = sv;
					}
				}
				if(!kong)dkong = false;
			}else{
				if(sx+mr <= yd[i][0] && x+mr >= yd[i][0] && y+mr > yd[i][1] && y <= yd[i][1]+yd[i][3]){
					x = yd[i][0]-mr;
				}else if(sx >= yd[i][0]+yd[i][2] && x <= yd[i][0]+yd[i][2] && y+mr > yd[i][1] && y <= yd[i][1]+yd[i][3]){
					x = yd[i][0]+yd[i][2];
				}
				if(x+mr > yd[i][0] && x < yd[i][2]+yd[i][0] && parseInt(y+mr) <= parseInt(yd[i][11]) && parseInt(y+mr+v) >= yd[i][1]){
					v = 0;
					y = yd[i][1]-mr;
					yd[i][12] = true;
				}else if(x+mr > yd[i][0] && x < yd[i][2]+yd[i][0] && parseInt(y) >= yd[i][1]+yd[i][3] && parseInt(y+v) <= yd[i][1]+yd[i][3]+yd[i][9]){
					v = 0;
					y = yd[i][1]+yd[i][3];
				}
				if(yd[i][12]){
					y = yd[i][1]-mr;
					if(v == sv){
						yd[i][12] = false;
					}
				}
				if(y == yd[i][1]-mr && v != sv){
					if(x+mr <= yd[i][0] || x >= yd[i][2]+yd[i][0]){
						yd[i][12] = false;
						kong = true;
					}else{
						v = 0;
						kong = false;
						if(jian)v = sv;
					}
				}
				if(!kong)dkong = false;
			}
		}
		for(var i=0;i<cs.length;i++){
			if(x > cs[i][0]-mr2 && x < cs[i][0]+mr2 && y > cs[i][1]-mr2 && y < cs[i][1]+mr2){
				if(cs[i][8]){
					x = cs[i][4];
					y = cs[i][5];
					v = 0;
					cs[i][8] = false;
				}
			}else if(x > cs[i][4]-mr2 && x < cs[i][4]+mr2 && y > cs[i][5]-mr2 && y < cs[i][5]+mr2){
				if(cs[i][8]){
					x = cs[i][0];
					y = cs[i][1];
					v = 0;
					cs[i][8] = false;
				}
			}else{
				cs[i][8] = true;
			}
		}
		kong = dkong;
		for(var i=0;i<bu.length;i++){
			if(x+mr > bu[i][0] && x < bu[i][0]+bu[i][2] && y+mr > bu[i][1] && y < bu[i][1]+bu[i][3]){
				dea();
				break;
			}
		}
		for(var i=0;i<ty.length;i++){
			if(x+mr > ty[i][0] && x < ty[i][0]+ty[i][2] && y+mr > ty[i][1] && y < ty[i][1]+ty[i][3]){
				dea();
				break;
			}
		}
		for(var i=0;i<bd.length;i++){
			if(x+mr > bd[i][0] && x < bd[i][0]+bd[i][2] && y+mr > bd[i][1] && y < bd[i][1]+bd[i][3]){
				dea();
				break;
			}
		}
		for(var i=0;i<bc.length;i++){
			if(x+mr > bc[i][0] && x < bc[i][0]+bc[i][2] && y+mr > bc[i][1] && y < bc[i][1]+bc[i][3] && bc[i][6] > 0){
				dea();
				break;
			}
		}
		for(var i=0;i<ly.length;i++){
			if(x+mr > ly[i][0] && x < ly[i][0]+ly[i][2] && y+mr > ly[i][1] && y < ly[i][1]+ly[i][3]){
				dea();
				break;
			}
		}
		for(var i=0;i<yq.length;i++){
			if(x+mr > yq[i][8] && x < yq[i][8]+yq[i][3] && y+mr > yq[i][9] && y < yq[i][9]+yq[i][4]){
				dea();
				break;
			}
		}
		for(var i=0;i<lt.length;i++){
			if(x+mr > lt[i][0] && x < lt[i][0]+lt[i][2] && y+mr > lt[i][1] && y < lt[i][1]+lt[i][3]){
				dea();
				break;
			}
		}
		for(var i=0;i<zb.length;i++){
			if(x+mr > zb[i][11] && x < zb[i][11]+zb[i][3] && y+mr > zb[i][12] && y < zb[i][12]+zb[i][4]){
				dea();
				break;
			}
		}
		if(y < 0){
			y = 0;
			v = 0;
		}else if(y > h){
			dea();
		}
		if(kong){
			v+=a;
		}
		if(v == 0 && nanc && !kong){
			jian = true;
			v = sv;
		}
		y+=v;
		sx2 = sx;
		sy2 = sy;
		sx2<x-2?sx2=x-2:sx2;
		sx2>x+2?sx2=x+2:sx2;
		sy2<y-2?sy2=y-2:sy2;
		sy2>y+2?sy2=y+2:sy2;
		ctx.fillStyle = '#f82';
		ctx.fillRect(x,y,mr,mr);
		ctx.beginPath();
		ctx.fillStyle = '#fff';
		ctx.arc(x+5,y+5,4,0,2*Math.PI);
		ctx.fill();
		ctx.beginPath();
		ctx.arc(x+15,y+5,4,0,2*Math.PI);
		ctx.fill();
		if(kong){
			ctx.fillStyle = '#fff';
			ctx.beginPath();
			ctx.arc(x+10,y+15,4,0,2*Math.PI);
			ctx.fill();
		}else{
			ctx.fillStyle = '#fff';
			ctx.beginPath();
			ctx.fillRect(x+2,y+12,16,6);
		}
		ctx.fillStyle = '#000';
		ctx.beginPath();
		ctx.arc(sx2+5,sy2+5,2,0,2*Math.PI);
		ctx.fill();
		ctx.beginPath();
		ctx.arc(sx2+15,sy2+5,2,0,2*Math.PI);
		ctx.fill();
		ctx.fillStyle = menustyle;
		ctx.fillRect(560,10,30,5);
		ctx.fillRect(560,20,30,5);
		ctx.fillRect(560,30,30,5);
		ctx.fillStyle = restyle;
		ctx.beginPath();
		ctx.moveTo(530,22);
		ctx.arc(530,22,14,pi2,2*pi2,true);
		ctx.closePath();
		ctx.fill();
		ctx.beginPath();
		ctx.fillStyle = '#fff';
		ctx.arc(530,22,10,0,4*pi2);
		ctx.closePath();
		ctx.fill();
		ctx.beginPath();
		ctx.fillStyle = restyle;
		ctx.moveTo(522,32);
		ctx.lineTo(530,24);
		ctx.lineTo(530,40);
		ctx.closePath();
		ctx.fill();
		ctx.fillStyle = tingstyle;
		ctx.fillRect(478,9,8,28);
		ctx.fillRect(494,9,8,28);
		if(x > chu[0]-mr2 && x < chu[0]+mr2 && y > chu[1]-mr2 && y < chu[1]+mr2){
			le++;
			tle = 0;
			fade = true;
			lev = false;
			mov = false;
		}
	}
	function dea(){
		lev = true;
		x = x2;
		y = y2;
		v = 0;
	}
	function over(){
		fade = false;
		lev = false;
		mov = false;
		level1 = false;
		ctx.fillStyle = '#999';
		ctx.fillRect(0,0,w,h);
		ctx.font = kaishisize+' 微软雅黑';
		ctx.fillStyle = '#fff';
		ctx.textAlign = 'center';
		ctx.fillText("恭喜通关", 300, 310);
	}
	function ranz(x1,x2){
		return Math.floor(Math.random()*(x2-x1+1)+x1);
	}
	function ran(x1,x2){
		return Math.random()*(x2-x1)+x1;
	}
	c.keydown(function(key){
		if((key.keyCode>36 && key.keyCode<41) || key.keyCode == 82 || key.keyCode == 32){
			if(key.keyCode == 37){
				mxl = xv;
			};
			if(key.keyCode == 39){
				mxr = xv;
			};
			if(key.keyCode == 38){
				nanc = true;
			};
			if(key.keyCode == 38 && !kong){
				jian = true;
				v = sv;
			};
			if(key.keyCode == 82){
				xuan();
			}
			if(key.keyCode == 32){
				if(level1){
					isStart = false;
					pause = true;
				}else if(pause){
					isStart = true;
					pause = false;
					level1 = true;
					mov = true;
					begin();
				}
			}
			return false;
		}
	});
	c.keyup(function(key){
		if(key.keyCode>36 && key.keyCode<41){
			if(key.keyCode == 37){
				mxl = 0;
			};
			if(key.keyCode == 39){
				mxr = 0;
			};
			if(key.keyCode == 38 && jian){
				jian = false;
				if(v < 0)v = v/2;
			};
			if(key.keyCode == 38){
				nanc = false;
			};
			return false;
		}
	});
	(function() {
		var lastTime = 0;
		var vendors = ['webkit', 'moz'];
		for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
			window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
			window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] ||
										  window[vendors[x] + 'CancelRequestAnimationFrame'];
		}
	
		if (!window.requestAnimationFrame) {
			window.requestAnimationFrame = function(callback, element) {
				var currTime = new Date().getTime();
				var timeToCall = Math.max(0, 16.7 - (currTime - lastTime));
				var id = window.setTimeout(function() {
					callback(currTime + timeToCall);
				}, timeToCall);
				lastTime = currTime + timeToCall;
				return id;
			};
		}
		if (!window.cancelAnimationFrame) {
			window.cancelAnimationFrame = function(id) {
				clearTimeout(id);
			};
		}
	}());
	begin();
});

</script>
<div style="text-align:center;">

</div>
</body>
</html>
