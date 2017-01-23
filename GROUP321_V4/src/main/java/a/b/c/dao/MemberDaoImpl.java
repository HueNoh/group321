package a.b.c.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.c.mybatis.MemberMapper;

@Repository
public class MemberDaoImpl implements MemberDaoInterface {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int loginChk(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.loginChk(map);
	}

	@Override
	public int chkIdDup(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.chkIdDup(map);
	}

	@Override
	public int insertMember(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertMember(map);
	}

	@Override
	public int deleteMember(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.deleteMember(map);
	}

	@Override
	public int insertBoard(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertBoard(map);
	}

}
