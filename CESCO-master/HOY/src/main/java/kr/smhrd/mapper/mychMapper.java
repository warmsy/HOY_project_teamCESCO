package kr.smhrd.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;



@Mapper
public interface mychMapper {
	
	

	public void insertch(@Param("ch_seq") int ch_seq, @Param("mb_id") String mb_id);
	
	public List<MychallengesVO> selectch(String mb_id);
	
	public List<MychallengesVO> selectsub(int mc_seq);
	public List<MychallengesVO> staticsch(@Param("mb_id") String mb_id);
	
	public int selectcountsuc(int ch_seq);
	
	public int selectcountch(int ch_seq);
	
	public int selectcountmych(@Param("mb_id")String mb_id, @Param("ch_seq")int seq);	
		
	
	public void subinsert(@Param("mc_seq") int mc_seq, @Param("mb_id") String mb_id, @Param("sub_img") String sub_img);
	
	
	public List<MychallengesVO> staticsch__(@Param("mb_id") String mb_id);
	

}

