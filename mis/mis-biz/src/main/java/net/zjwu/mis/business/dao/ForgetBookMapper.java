package net.zjwu.mis.business.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.zjwu.mis.business.model.ForgetBook;
import tk.mybatis.mapper.common.Mapper;

public interface ForgetBookMapper extends Mapper<ForgetBook> {

	List<ForgetBook> showMessage(@Param(value="uid")String uid);

	int addMessage(@Param(value="uid")String uid,@Param(value="content") String content);

	int delForgetBook(@Param(value="id")int id);
}