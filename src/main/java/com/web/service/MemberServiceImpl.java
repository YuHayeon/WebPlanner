package com.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.dao.MemberDAO;
import com.web.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
		
	}
	
}
