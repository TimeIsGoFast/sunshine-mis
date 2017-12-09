package net.zjwu.mis.test.dao;

import net.zjwu.mis.test.model.Test;
import tk.mybatis.mapper.common.Mapper;

public interface TestMapper extends Mapper<Test> {
	
	Test getTestByNo(String no);
	
	void deleteByNo(String no);
}