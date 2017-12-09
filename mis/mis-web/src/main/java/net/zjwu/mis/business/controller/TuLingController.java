package net.zjwu.mis.business.controller;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author  �����  E-mail: 1501122784@qq.com
 * @date ����ʱ�䣺2017��6��27�� ����5:56:06 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
@Controller
@RequestMapping("/anon/tuling")
public class TuLingController {
   
	@RequestMapping("/render")
	public String render(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();	
		model.addAttribute("uid", uid);
		return "tuling/tuling";
	}
	
	//在线聊天
	@RequestMapping("/socket")
	public String socket(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();	
		model.addAttribute("uid", uid);
		return "webSocket/socket";
	}
	@RequestMapping("/socket2")
	public String sockets(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();	
		model.addAttribute("uid", uid);
		return "webSocket/socket2";
	}
	
}
