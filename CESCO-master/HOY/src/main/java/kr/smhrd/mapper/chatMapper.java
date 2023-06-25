package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface chatMapper {

    public void insert_botChatting(ChatVO vo);

    public void insert_userChatting(ChatVO vo);

}