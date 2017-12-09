package net.zjwu.mis.business.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.model.LeaveMessage;
import net.zjwu.mis.business.model.MessageInfo;
import net.zjwu.mis.business.service.MessageService;
import net.zjwu.mis.utils.HtmlFilter;

@Controller
@RequestMapping("/anon/message")
public class MessageController {
   @Autowired
   private MessageService messageService;
	 
   //展示留言列表
	@RequestMapping("/showMessage")
	@ResponseBody
	public List<MessageInfo> showMessage(int page,int rows){
		
		PageInfo<MessageInfo> pages = messageService.showMessage(page,rows);
		
		return pages.getList();
		
	}
	
	//发布留言功能
	@RequestMapping("/addMessage")
	@ResponseBody
	public int addMessage(String content){
		content=HtmlFilter.delHTMLTag(content);
		int info;
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
		if(uid==null){
			info = 2;
		}else{
			info = messageService.addMessage(uid,content);	
		}
		return info;
	}
	
	
}
