package kr.smhrd.mapper;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class MychallengesVO {

    private int mc_seq;
    private int ch_seq;
    private String mb_id;
    private int mc_success;
    private String mc_start;
    private String mc_end;
    private String ch_title;
    private int ch_time;
    private String ch_content;
    private String ch_img1;
    private String ch_img2;
    private int ch_reward;
    private int ch_kind;
    private int suc_num;
    private int ch_num;
    private int kind1;
    private int kind2;
    private int kind3;

    //private Date ch_date;
}

