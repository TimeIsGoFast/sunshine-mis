package net.zjwu.mis.business.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.model.SuiBi;
import net.zjwu.mis.business.service.ForgetBookService;
import net.zjwu.mis.business.service.SuiBiService;
import net.zjwu.mis.utils.HtmlFilter;

@Controller
@RequestMapping("/anon/suibi")
public class SuiBiController {
   
	@Autowired
	private SuiBiService suiBiService;
	@Autowired
	private ForgetBookService forgetBookService;
	@RequestMapping("/render.do")
	public String render(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
		String headimg = forgetBookService.getheadimg(uid);
		model.addAttribute("headimg", headimg);
		if(uid==null){
			return "redirect:/renderLogin.do";
		}else{
			return "suibi/suibi";
		}
		
		
	}
	
	//添加随笔
	@RequestMapping("/addSuibi")
	@ResponseBody
	public int addSuibi(SuiBi suiBi){
		suiBi.setContent(HtmlFilter.delHTMLTag(suiBi.getContent()));
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
		suiBi.setUid(uid);
		
		int info = suiBiService.addSuibi(suiBi);
		return info;
		
	}
	
	//展示列表
	@RequestMapping("/showMessage")
	@ResponseBody
	public List<SuiBi> showMessage(int page,int rows){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();	
		PageInfo<SuiBi> pages = suiBiService.showMessage(page,rows,uid);
			
		return pages.getList();
			
	}
	
	//查看随笔功能
	@RequestMapping("/getDetail")
	@ResponseBody
	public SuiBi getDetail(int id){
		return suiBiService.getSuiBiById(id);
	}
	
   //删除随笔操作
	@RequestMapping("/delSuibi")
	@ResponseBody
	public int delSuibi(int id){
		return suiBiService.delSuibi(id);
	}
	
}
