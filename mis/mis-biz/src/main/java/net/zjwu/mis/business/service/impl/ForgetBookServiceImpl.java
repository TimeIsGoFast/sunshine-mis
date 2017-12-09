package net.zjwu.mis.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.dao.ForgetBookMapper;
import net.zjwu.mis.business.dao.PerfectInfoMapper;
import net.zjwu.mis.business.model.ForgetBook;
import net.zjwu.mis.business.service.ForgetBookService;

@Service
@Transactional
public class ForgetBookServiceImpl implements ForgetBookService {
   @Autowired
   private ForgetBookMapper forgetBookMapper;
	
   @Autowired
   private PerfectInfoMapper perfectInfoMapper;
	@Override
	public PageInfo<ForgetBook> showMessage(int page, int rows,String uid) {
		PageHelper.startPage(page, rows);
		List<ForgetBook> list = forgetBookMapper.showMessage(uid);
		PageInfo<ForgetBook> pages = new PageInfo<ForgetBook>(list);
		return pages;
	}

	@Override
	public int addMessage(String uid, String content) {
		// TODO Auto-generated method stub
		return forgetBookMapper.addMessage(uid,content);
	}

	@Override
	public int delForgetBook(int id) {
		// TODO Auto-generated method stub
		return forgetBookMapper.delForgetBook(id);
	}

	@Override
	public String getheadimg(String uid) {
		// TODO Auto-generated method stub
		return perfectInfoMapper.getheadimg(uid);
	}

}
