package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCalendarVO {

	private int mood_seq;
	private String mood_date;
	private int mood_type;
	private String wordcloud;
	private String mb_id;
	private int emotion0;
	private int emotion1;
	private int emotion2;
	private int emotion3;
	
}