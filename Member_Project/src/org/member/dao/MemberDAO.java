package org.member.dao;

import java.util.ArrayList;

import org.member.dto.MemberDTO;

public interface MemberDAO {
	//�߰�-�Ϸ�
	public void memInsert(MemberDTO member);
	//��ü����-�Ϸ�
	public ArrayList<MemberDTO> memList();
	//����-�Ϸ�
	public int memUpdate(MemberDTO member);
	//�󼼺���
	public MemberDTO findById(String userid);
	//����-�Ϸ�
	public void memDelete(String userid);
	//���̵� �ߺ�üũ
	public String idCheck(String userid);
	
	//�α��� üũ-�Ϸ�
	//int flag=dao.loginCheck(userid,pwd);
	public int loginCheck(String userid, String pwd);
	
	//ȸ����
	public int getCount();
}
