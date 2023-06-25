package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberVO {

	   private String mb_id;
	   private String mb_pwd;
	   private String mb_gender;
	   private int mb_age;
	   private String mb_job;
	   private String mb_email;
	   private String mb_nickname;
	   private String mb_joindate ;
	   private String admin_yn;
	   private int mb_point;
	

	
}
