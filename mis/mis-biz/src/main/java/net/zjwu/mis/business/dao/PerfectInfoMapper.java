package net.zjwu.mis.business.dao;

import org.apache.ibatis.annotations.Param;

import net.zjwu.mis.business.model.PerfectInfo;
import net.zjwu.mis.system.model.User;
import tk.mybatis.mapper.common.Mapper;

public interface PerfectInfoMapper extends Mapper<PerfectInfo> {

	PerfectInfo getPerfectInfoByUid(@Param(value="uid")String uid);

	int addPerfectInfo(PerfectInfo perfectInfo);

	int updatePerfectInfo(PerfectInfo perfectInfo);

	String getheadimg(@Param(value="uid")String uid);

	void insertIntoInfo(User user);
}