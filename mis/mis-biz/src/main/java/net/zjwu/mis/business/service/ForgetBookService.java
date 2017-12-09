package net.zjwu.mis.business.service;

import com.github.pagehelper.PageInfo;

import net.zjwu.mis.business.model.ForgetBook;

public interface ForgetBookService {

	PageInfo<ForgetBook> showMessage(int page, int rows, String uid);

	int addMessage(String uid, String content);

	int delForgetBook(int id);

	String getheadimg(String uid);

}
