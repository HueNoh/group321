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

	public List selectBoard();

	public int insertList(Map map);

	public int updateList(Map map);

	public int deleteList(Map map);

	public List selectList();

	public List searchBoard(Map map);

	public List searchList(Map map);

	public int msgInsert(Map map);

	public List msgSelect(Map map);

	public List maxCh_num(Map map);
}
