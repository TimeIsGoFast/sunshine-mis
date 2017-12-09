package net.zjwu.mis.business.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.model.ForgetBook;
import net.zjwu.mis.business.service.ForgetBookService;
import net.zjwu.mis.utils.HtmlFilter;

@Controller
@RequestMapping("/anon/forgetBook")
public class ForgetBookController {
    @Autowired
    private ForgetBookService forgetBookService;
	@RequestMapping("/showForgetBook")
	public String showForgetBook(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
		//查询出头像
		String headimg = forgetBookService.getheadimg(uid);
		model.addAttribute("headimg", headimg);
		if(uid==null){
			return "redirect:/renderLogin.do";
		}else{
			return "forgetbook/forgetbook";
		}
		
	}
	
	   //展示备忘录列表
	@RequestMapping("/showMessage")
	@ResponseBody
	public List<ForgetBook> showMessage(int page,int rows){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();	
		PageInfo<ForgetBook> pages = forgetBookService.showMessage(page,rows,uid);
			
		return pages.getList();
			
	}
	
	//添加备忘录功能
	@RequestMapping("/addMessage")
	@ResponseBody
	public int addMessage(String content){
		content=HtmlFilter.delHTMLTag(content);
		int info;
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
	    info = forgetBookService.addMessage(uid,content);	
		return info;
	}
    
	//删除备忘录
	@RequestMapping("/delForgetBook")
	@ResponseBody
	public int delForgetBook(int id){
		int info = forgetBookService.delForgetBook(id);
		return info;
	}
	
}
