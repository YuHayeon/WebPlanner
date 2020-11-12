package com.web.dao;

import com.web.vo.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void register(MemberVO vo) throws Exception;
}
