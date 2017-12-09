package net.zjwu.mis.business.dao;

import org.apache.ibatis.annotations.Param;

import net.zjwu.mis.business.model.LeaveMessage;
import tk.mybatis.mapper.common.Mapper;

public interface LeaveMessageMapper extends Mapper<LeaveMessage> {

	int addMessage(@Param(value="uid")String uid, @Param(value="content")String content);
}