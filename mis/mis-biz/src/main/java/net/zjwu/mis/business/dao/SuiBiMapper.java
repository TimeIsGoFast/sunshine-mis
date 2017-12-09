package net.zjwu.mis.business.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.zjwu.mis.business.model.SuiBi;
import tk.mybatis.mapper.common.Mapper;

public interface SuiBiMapper extends Mapper<SuiBi> {

	int addSuiBi(SuiBi suiBi);

	List<SuiBi> showMessage(@Param(value="uid")String uid);

	SuiBi getSuiBiById(@Param(value="id")int id);

	int delSuibi(@Param(value="id")int id);
}