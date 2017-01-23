package a.b.c.dao;

import java.util.List;
import java.util.Map;

public interface MemberDaoInterface {
	public int loginChk(Map map);
	public int chkIdDup(Map map);
	public int insertMember(Map map);
	public int deleteMember(Map map);
	public List selectMember();
	public int insertBoard(Map map);
	public int updateBoard(Map map);
	public int deleteBoard(Map map);
}
