package net.zjwu.mis.business.service;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.model.MessageInfo;

public interface MessageService {

	PageInfo<MessageInfo> showMessage(int page, int rows);

	int addMessage(String uid, String content);

}
