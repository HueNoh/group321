package a.b.c.mybatis;

import java.util.Map;

public interface MemberMapper {
	public int loginChk(Map map);
	public int chkIdDup(Map map);
	public int insertMember(Map map);
	public int deleteMember(Map map);
	public int insertBoard(Map map);
}
