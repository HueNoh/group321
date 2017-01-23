package a.b.c.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import a.b.c.dao.MemberDaoInterface;

@Component
public class MemberServiceImpl implements MemberServiceInterface {

	@Autowired
	MemberDaoInterface memberDao;
	
	@Override
	public int loginChk(Map map) {
		// TODO Auto-generated method stub
		return memberDao.loginChk(map);
	}

}
