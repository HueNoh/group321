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

	public List selectBoardMember(Map map);

	public int insertList(Map map);

	public int updateList(Map map);

	public int deleteList(Map map);

	public List selectList(Map map);

	public int insertCard(Map map);

	public int updateCard(Map map);

	public int deleteCard(Map map);

	public List selectCard(Map map);

	public List selectCardDetail(Map map);
	public List moveList(Map map);

	public int msgInsert(Map map);

	public List msgSelect(Map map);

	public List maxCh_num(Map map);
}
