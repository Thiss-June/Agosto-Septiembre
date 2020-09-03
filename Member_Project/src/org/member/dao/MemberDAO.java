package org.member.dao;

import java.util.ArrayList;

import org.member.dto.MemberDTO;

public interface MemberDAO {
	//추가-완료
	public void memInsert(MemberDTO member);
	//전체보기-완료
	public ArrayList<MemberDTO> memList();
	//수정-완료
	public int memUpdate(MemberDTO member);
	//상세보기
	public MemberDTO findById(String userid);
	//삭제-완료
	public void memDelete(String userid);
	//아이디 중복체크
	public String idCheck(String userid);
	
	//로그인 체크-완료
	//int flag=dao.loginCheck(userid,pwd);
	public int loginCheck(String userid, String pwd);
	
	//회원수
	public int getCount();
}
