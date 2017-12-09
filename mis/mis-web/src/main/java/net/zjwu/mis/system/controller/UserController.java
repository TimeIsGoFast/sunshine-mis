/**
 * 
 */
package net.zjwu.mis.system.controller;

import java.util.List;

import net.zjwu.mis.base.controller.BaseController;
import net.zjwu.mis.system.model.User;
import net.zjwu.mis.system.service.UserRoleService;
import net.zjwu.mis.system.service.UserService;
import net.zjwu.mis.system.vo.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

/**
 * @author Lay
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User> {

	@Autowired
	private UserService userService;

	@Autowired
	private UserRoleService userRoleService;

	@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo<User> listUsers(@RequestParam int page,
			@RequestParam int rows, @ModelAttribute User condition) {
		PageInfo<User> pageInfo = userService.listUsersPaged(page, rows,
				condition);
		return pageInfo;
	}

	@RequestMapping(value = "/render")
	public String render() {
		return "system/user/list";
	}

	@RequestMapping(value = "/saveUserRoles")
	@ResponseBody
	public Result saveUserRoles(@ModelAttribute User user) {
		Result result = new Result();
		try {
			userRoleService.saveUserRoles(user);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}

	@RequestMapping(value = "/getUsersByRoleId")
	@ResponseBody
	public List<User> getUsersByUserId(@RequestParam int roleId) {
		return userService.getUsersByRoleId(roleId);
	}

	@RequestMapping(value = "/userSelect")
	public String roleSelect(Model model, @RequestParam int roleId) {
		model.addAttribute("roleId", roleId);
		return "select/userSelect";
	}
	
	//注册
	@RequestMapping("/register")
	@ResponseBody
	public int register(Model model,User user){
		int info;
		model.addAttribute("user", user);
		User us = userService.getUserByUid(user.getUid());
		if(us!=null){
			info=0;
			
		}else{
			info = userService.save(user);
			userService.insertIntoInfo(user);
		}
		
		return info;
		
	}
}
