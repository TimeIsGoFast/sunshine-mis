package net.zjwu.mis.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.dao.SuiBiMapper;
import net.zjwu.mis.business.model.SuiBi;
import net.zjwu.mis.business.service.SuiBiService;

@Service
@Transactional
public class SuiBiServiceImpl implements SuiBiService{
    @Autowired
    private SuiBiMapper suiBiMapper;
	
	@Override
	public int addSuibi(SuiBi suiBi) {
		return suiBiMapper.addSuiBi(suiBi);
	}

	@Override
	public PageInfo<SuiBi> showMessage(int page, int rows, String uid) {
		PageHelper.startPage(page, rows);
		List<SuiBi> list = suiBiMapper.showMessage(uid);
		PageInfo<SuiBi> pages = new PageInfo<SuiBi>(list);
		return pages;
	}

	@Override
	public SuiBi getSuiBiById(int id) {
		return suiBiMapper.getSuiBiById(id);
	}

	@Override
	public int delSuibi(int id) {
		// TODO Auto-generated method stub
		return suiBiMapper.delSuibi(id);
	}
  
	
}
