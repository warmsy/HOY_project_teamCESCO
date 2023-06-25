package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
//@NoArgsConstructor
@Data
public class ChatVO {

    public ChatVO(String mb_id, String chat_user, String chat_chatbot) {
        this.mb_id = mb_id;
        this.chat_user = chat_user;
        this.chat_chatbot = chat_chatbot;
    }

    private String mb_id;
    private String chat_seq;
    private String chat_user;
    private String chat_chatbot;
    private String chat_emotion;
    private String chat_date;

}

