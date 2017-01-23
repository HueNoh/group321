package a.b.c.mybatis;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
	public int loginChk(Map map);
	public int chkIdDup(Map map);
	public int insertMember(Map map);
	public int deleteMember(Map map);
	public List selectMember();
	public int insertBoard(Map map);
}
