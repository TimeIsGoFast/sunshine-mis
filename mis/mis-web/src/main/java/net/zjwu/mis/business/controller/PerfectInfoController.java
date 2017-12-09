package net.zjwu.mis.business.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.zjwu.mis.business.model.PerfectInfo;
import net.zjwu.mis.business.service.PerfectInfoService;
import net.zjwu.mis.system.model.User;
import net.zjwu.mis.system.service.UserService;

@Controller
@RequestMapping("/anon/perfectInfo")
public class PerfectInfoController {
    @Autowired
    private UserService userService;
    
    @Autowired
    private PerfectInfoService perfectInfoService;
	
	@RequestMapping("/render")
	public String render(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
		model.addAttribute("uid", uid);
		return "perfectInfo/perfectInfo";
		
	}
	
	@RequestMapping("/addInfo")
	public String addInfo(PerfectInfo perfectInfo,@RequestParam MultipartFile imgfile,HttpServletRequest request,Model model) throws IllegalStateException, IOException{
       	String uid = perfectInfo.getUid();
       	String message="";
		
		String originalFilename = imgfile.getOriginalFilename();
		if(imgfile!=null && originalFilename!=null && originalFilename.length()>0){
			//得到保存路径
			String savepath = request.getServletContext().getRealPath("/upload/touxiang");
			//得到新的图片名称
			String filename = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			File newfile = new File(savepath+File.separator+filename);
			//将图片存到硬盘里
			imgfile.transferTo(newfile);
			//将图片名称存到数据库
			perfectInfo.setHeadimg(filename);
		}
		int info = perfectInfoService.addInfo(perfectInfo);
		if(info==1){
		   message = "完善个人信息成功！";	
			
		}else if(info==0){
			message="完善个人信息失败";
		
		}else{
			message="出现未知错误";
			
		}
		model.addAttribute("uid", uid);
		model.addAttribute("message", message);
		return "perfectInfo/perfectInfo";
	}
	
	//通过uid得到user
	@RequestMapping("/getInfoByuid")
	@ResponseBody
	public PerfectInfo getInfoByuid(String uid){
		PerfectInfo perfectInfo = perfectInfoService.getPerfectInfoByUid(uid);
		return perfectInfo;
		
	}
	
}
