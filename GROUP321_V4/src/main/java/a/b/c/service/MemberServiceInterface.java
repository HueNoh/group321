package a.b.c.service;

import java.util.List;
import java.util.Map;

public interface MemberServiceInterface {

	public int loginChk(Map map);

	public List searchBoard(Map map);

	public List searchList(Map map);

	public List searchCard(Map map);

	public List selectCardDetail(Map map);

	public List selectBoardMember(Map map);

	public int msgInsert(Map map) throws Exception;

	public List msgSelect(Map map) throws Exception;

	public List insertBoard(Map map);

	public List insertList(Map map);

	public List insertCard(Map map);
	public List moveList(Map map);
}
