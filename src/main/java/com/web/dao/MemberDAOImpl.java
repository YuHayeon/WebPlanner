package com.web.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	// ȸ������

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sql.selectOne("memberMapper.login", vo);
	}

	
}
