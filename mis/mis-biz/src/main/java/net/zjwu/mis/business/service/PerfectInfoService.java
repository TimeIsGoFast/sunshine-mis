package net.zjwu.mis.business.service;

import net.zjwu.mis.business.model.PerfectInfo;

public interface PerfectInfoService {

	int addInfo(PerfectInfo perfectInfo);

	PerfectInfo getPerfectInfoByUid(String uid);

}
