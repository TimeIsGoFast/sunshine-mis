/**
 * 
 */
package net.zjwu.mis.test.service;

import java.util.List;

import net.zjwu.mis.base.service.BaseService;
import net.zjwu.mis.test.model.Test;

/**
 * @author Lay
 *
 */
public interface TestService extends BaseService<Test>{

	Test getTestByNo(String no);
	
	void createTest(Test test);
	
	void updateTest(Test test);
	
	void deleteTest(Integer id);
	
	void deleteByNo(String no);
	
	
	List<Test> getAll();
}
