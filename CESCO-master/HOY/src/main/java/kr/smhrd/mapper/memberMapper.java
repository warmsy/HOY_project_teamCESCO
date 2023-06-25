package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.mapper.MemberVO;

@Mapper
public interface memberMapper {
	
	
	
	public void insertMember(MemberVO vo); 

	public void updateMember(MemberVO vo);

	public String checkId(String mb_id);
	
	public MemberVO login(MemberVO vo);
	
//	public MemberVO admin_login(MemberVO vo);
//	// Admin계정은 디비에서 추가

	public List<MyCalendarVO> MyCalendarAjax(MemberVO vo);

	
}

