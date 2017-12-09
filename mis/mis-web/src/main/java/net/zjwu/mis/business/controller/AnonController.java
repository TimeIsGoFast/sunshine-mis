package net.zjwu.mis.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/anon")
public class AnonController {
     
	//在线翻译
	@RequestMapping("/translation")
	public String translation(){
		return "anon/translation";
	}
	
	//游戏主页面
	@RequestMapping("game")
	public String game(){
		return "anon/game";
	}
	
	//2048游戏
	@RequestMapping("/game1")
	public String game1(){
		return "game/game1";
	}
	
	//过关小游戏
	@RequestMapping("/guoguan")
	public String guogaun(){
		return "game/guoguan";
	}
	
	//留言
	@RequestMapping("/liuyan")
	public String liuyan(){
		return "liuyan/liuyan";
	}
	

}
