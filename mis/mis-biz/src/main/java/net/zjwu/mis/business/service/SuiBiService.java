package net.zjwu.mis.business.service;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.model.SuiBi;

public interface SuiBiService {

	int addSuibi(SuiBi suiBi);

	PageInfo<SuiBi> showMessage(int page, int rows, String uid);

	SuiBi getSuiBiById(int id);

	int delSuibi(int id);

}
