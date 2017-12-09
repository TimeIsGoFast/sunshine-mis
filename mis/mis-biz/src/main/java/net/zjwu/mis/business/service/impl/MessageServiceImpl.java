package net.zjwu.mis.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.dao.LeaveMessageMapper;
import net.zjwu.mis.business.dao.MessageInfoMapper;
import net.zjwu.mis.business.model.MessageInfo;
import net.zjwu.mis.business.service.MessageService;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageInfoMapper messageInfoMapper;
    
    @Autowired
    private LeaveMessageMapper leaveMessageMapper;
	
	@Override
	public PageInfo<MessageInfo> showMessage(int page, int rows) {
		PageHelper.startPage(page, rows);
		List<MessageInfo> list = messageInfoMapper.showMessage();
		PageInfo<MessageInfo> pages = new PageInfo<MessageInfo>(list);
		return pages;
	}

	@Override
	public int addMessage(String uid, String content) {
		
		return leaveMessageMapper.addMessage(uid,content);
	}

}
