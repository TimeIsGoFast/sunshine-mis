/**
 * 
 */
package net.zjwu.mis.test.service.impl;

import java.util.List;

import net.zjwu.mis.base.service.impl.BaseServiceImpl;
import net.zjwu.mis.test.dao.TestMapper;
import net.zjwu.mis.test.model.Test;
import net.zjwu.mis.test.service.TestService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Lay
 *
 */
@Service
@Transactional
public class TestServiceImpl extends BaseServiceImpl<Test> implements
		TestService {

	@Autowired
	private TestMapper testMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.zjwu.mis.test.service.TestService#getTestByNo(java.lang.String)
	 */
	@Override
	public Test getTestByNo(String no) {
		// Example example = new Example(Test.class);
		// example.createCriteria().andEqualTo("no", no);
		// List<Test> tests = testMapper.selectByExample(example);
		// return tests.get(0);
		return testMapper.getTestByNo(no);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.zjwu.mis.test.service.TestService#createTest(net.zjwu.mis.test.model
	 * .Test)
	 */
	@Override
	public void createTest(Test test) {
		Test testInDB = testMapper.getTestByNo(test.getNo());
		if (testInDB != null) {
			throw new RuntimeException("the no is already exists:"
					+ test.getNo());
		}
		testMapper.insert(test);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.zjwu.mis.test.service.TestService#updateTest(net.zjwu.mis.test.model
	 * .Test)
	 */
	@Override
	public void updateTest(Test test) {
		testMapper.updateByPrimaryKey(test);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.zjwu.mis.test.service.TestService#deleteTest(java.lang.Integer)
	 */
	@Override
	public void deleteTest(Integer id) {
		testMapper.deleteByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see net.zjwu.mis.test.service.TestService#deleteByNo(java.lang.String)
	 */
	@Override
	public void deleteByNo(String no) {
		testMapper.deleteByNo(no);
	}

	/* (non-Javadoc)
	 * @see net.zjwu.mis.test.service.TestService#getAll()
	 */
	@Override
	public List<Test> getAll() {
		return testMapper.selectAll();
	}

	
}
