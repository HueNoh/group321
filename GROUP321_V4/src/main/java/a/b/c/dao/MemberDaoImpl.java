package a.b.c.dao;

import java.util.List;
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
	public List selectMember() {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectMember();
	}
	
	@Override
	public int insertBoard(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertBoard(map);
	}

	@Override
	public int updateBoard(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updateBoard(map);
	}

	@Override
	public int deleteBoard(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.deleteBoard(map);
	}

	@Override
	public List selectBoard() {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectBoard();
	}

	@Override
	public int insertList(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertList(map);
	}

	@Override
	public int updateList(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updateList(map);
	}

	@Override
	public int deleteList(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.deleteList(map);
	}

	@Override
	public List selectList() {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectList();
	}

	

}
