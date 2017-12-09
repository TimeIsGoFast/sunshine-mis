package net.zjwu.mis.business.dao;

import java.util.List;

import net.zjwu.mis.business.model.MessageInfo;
import tk.mybatis.mapper.common.Mapper;

public interface MessageInfoMapper extends Mapper<MessageInfo> {

	List<MessageInfo> showMessage();
}