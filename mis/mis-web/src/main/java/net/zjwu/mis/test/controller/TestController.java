/**
 * 
 */
package net.zjwu.mis.test.controller;

import java.util.List;

import net.zjwu.mis.base.controller.BaseController;
import net.zjwu.mis.test.model.Test;
import net.zjwu.mis.test.service.TestService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Lay
 *
 */
@Controller
@RequestMapping("/test")
public class TestController extends BaseController<Test>{

	@Autowired
	private TestService testService;
	
	@RequestMapping(value="/list")
	@ResponseBody
	public List<Test> list(){
		return testService.getAll();
	}
	
	@RequestMapping(value="render")
	public String render(){
		return "test/list";
	}
}
