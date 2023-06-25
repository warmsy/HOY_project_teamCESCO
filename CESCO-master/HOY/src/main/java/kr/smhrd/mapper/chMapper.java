package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface chMapper {
	
	

	public List<ChallengesVO> kind1();
	
	public List<ChallengesVO> kind2();
	
	public List<ChallengesVO> kind3();
	
	public List<ChallengesVO> contents(int seq);
	
	

	
}

