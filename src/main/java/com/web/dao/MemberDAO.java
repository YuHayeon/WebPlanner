package com.web.dao;

import com.web.vo.MemberVO;

public interface MemberDAO {
	// ȸ������
	public void register(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo) throws Exception;
	
	
}