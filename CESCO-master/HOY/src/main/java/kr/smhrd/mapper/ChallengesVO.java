package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChallengesVO {

	   private int ch_seq;
	   private String ch_title;
	   private int ch_time;
	   private String ch_content;
	   private String ch_img1;
	   private String ch_img2;
	   private int ch_reward;
	   private int ch_kind;
	
}

