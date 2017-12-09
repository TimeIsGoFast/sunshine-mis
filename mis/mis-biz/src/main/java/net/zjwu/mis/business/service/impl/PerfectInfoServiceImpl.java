package net.zjwu.mis.business.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.zjwu.mis.business.dao.PerfectInfoMapper;
import net.zjwu.mis.business.model.PerfectInfo;
import net.zjwu.mis.business.service.PerfectInfoService;
import net.zjwu.mis.system.dao.UserMapper;
import net.zjwu.mis.system.model.User;

@Service
@Transactional
public class PerfectInfoServiceImpl implements PerfectInfoService {
    @Autowired
    private PerfectInfoMapper perfectInfoMapper;
    
    @Autowired
    private UserMapper userMapper;
	@Override
	public int addInfo(PerfectInfo perfectInfo) {
		//得到当前时间
		Date date =new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String time = df.format(date);
		perfectInfo.setTime(time);
		
		//修改user表中昵称
		userMapper.updateUserName(perfectInfo.getUid(),perfectInfo.getNickname());
		
		int info;
		//首先去表中查询改账号是否已经完善过信息，如果完善过信息就调用修改方法，如果没有，则用插入的方式来完善信息
		PerfectInfo  pf = perfectInfoMapper.getPerfectInfoByUid(perfectInfo.getUid());
		if(pf==null){
			 info = perfectInfoMapper.addPerfectInfo(perfectInfo);		
		}else{
			info = perfectInfoMapper.updatePerfectInfo(perfectInfo);
		}
		
		
		return info;
	}
	@Override
	public PerfectInfo getPerfectInfoByUid(String uid) {
		PerfectInfo perfectInfo = 	perfectInfoMapper.getPerfectInfoByUid(uid);
		if(perfectInfo==null){
			PerfectInfo pf = new PerfectInfo();
			User user = userMapper.getUserByUid(uid);
			pf.setNickname(user.getName());
			pf.setUid(uid);
			return pf;
		}else{
			return perfectInfo;
		}
		
		
	}

}
