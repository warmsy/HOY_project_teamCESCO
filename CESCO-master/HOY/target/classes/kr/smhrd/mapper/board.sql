-- 쁘롬 거누님
use campus_E_3_1022;
drop table submissions cascade;
drop table mychallenges cascade;
drop table challenges cascade;
drop table chattings cascade;
drop table mycalender cascade;
drop table members cascade;

select * from imgtest;
CREATE TABLE imgtest
(	user_id VARCHAR(30) NOT NULL ,
	img_url VARCHAR(2000) NOT NULL,
	sorf int NOT NULL
)

update submissions set sub_result = 1 where sub_seq = 56;
update mychallenges set mc_success = 1 where mc_seq = 33;

<<<<<<< HEAD
select count(mc_seq) from mychallenges where mc_success=1 and ch_seq = 4

=======
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-4/CESCO.git
select * from challenges;
select * from mychallenges;
select * from submissions;
select * from mycalendar
select * from members

delete from submissions;
delete from mychallenges;

update mycalendar set wordcloud = '123_3.png' where 
update mycalendar set wordcloud = '123_2021-11-06.png' where mood_date like '2021-11-05%'
123_2021-11-06.png
sub_seq, id, image이름
update submissions set sub_result = 2 
                where sub_seq = 56
select 
       count(case when c.ch_kind = 1 then 1 end) as kind1,
      count(case when c.ch_kind = 2 then 1 end) as kind2,
      count(case when c.ch_kind = 3 then 1 end) as kind3
      from mychallenges m, challenges c
       where c.ch_seq=m.ch_seq
       and m.mb_id= '123'
       and m.mc_success = 1
       
update members set mb_point = 300 where mb_id = '123'

delete from submissions;

insert into submissions(mc_seq, mb_id, sub_result, sub_img) values (2,'123',0,'imggg.jpg')

insert into members(mb_id, mb_pwd, mb_gender, mb_age, mb_job, mb_email, mb_nickname,admin_yn) 
		values (#{mb_id},#{mb_pwd},#{mb_gender},#{mb_age},#{mb_job}, #{mb_email}, #{mb_nickname},0)

insert into challenges(ch_title, ch_time, ch_content, ch_reward) 
		values ('1일 1사과!',14,'하루에 한번씩 사과를 드시고 사과를 찍어 인증샷을 올려주세요!',100)
		
insert into challenges(ch_title, ch_time, ch_content, ch_reward) values ('야구 취미 만들기!',14,'하루에 한번씩 야구를 하고 방망이나 글러브를 사진으로 업로드해주세요!',100)
CREATE TABLE members(
    mb_id VARCHAR(30) NOT NULL, 
    mb_pwd VARCHAR(30) NOT NULL, 
    mb_gender VARCHAR(1) NOT NULL, 
    mb_age INT NOT NULL, 
    mb_job VARCHAR(30) NOT NULL, 
    mb_email VARCHAR(30) NOT NULL, 
    mb_nickname VARCHAR(30) NOT NULL, 
    mb_joindate DATETIME DEFAULT NOW(),
    admin_yn INT NOT NULL, 
    mb_point INT NOT NULL DEFAULT 0,

insert into challenges(ch_title, ch_time, ch_content, ch_reward, ch_kind) values ('책읽기!',14,'하루에 한번씩 독서 후 책을 사진으로 업로드해주세요!',100, 2)
		
insert into mychallenges(ch_seq, mb_id, mc_success, mc_end) 
		values (1,'123',0,now()+interval 14 day)
		
		select * from mychallenges m, challenges c 
	    where m.mb_id='123'
	    and  '2021.11.15' < m.mc_end
	    and c.ch_seq=m.ch_seq
	    order by m.mc_start desc
	    
select * from mychallenges m, challenges c
	      where m.mc_seq=13
	      and c.ch_seq=m.ch_seq
	      
select * from mychallenges m, submissions s
	      where m.mc_seq=13
	      and s.mc_seq=m.mc_seq
	      
select * from mychallenges m, submissions s
	      where m.mc_seq=2
	      and s.mc_seq=m.mc_seq
	      
delete from mychallenges
where mc_seq = 1

--DELETE FROM 테이블이름 WHERE 필드이름=데이터값
-- UPDATE 테이블이름 SET col1 = value1 , col2 = value2...
-- SELECT * FROM 테이블이름	
		
CREATE TABLE members
(
    mb_id          VARCHAR(30)     NOT NULL COMMENT '회원 아이디', 
    mb_pwd         VARCHAR(30)     NOT NULL COMMENT '회원 비밀번호', 
    mb_gender      VARCHAR(1)      NOT NULL COMMENT '회원 성별', 
    mb_age         int            NOT NULL COMMENT '회원 나이', 
    mb_job         VARCHAR(30)     NOT NULL COMMENT '회원 직업', 
    mb_email       VARCHAR(30)     NOT NULL COMMENT '회원 연락처', 
    mb_nickname    VARCHAR(30)     NOT NULL COMMENT '회원 닉네임', 
    mb_joindate    DATETIME        NOT NULL default now() COMMENT '가입 일자' , 
    admin_yn       VARCHAR(1)      NOT NULL COMMENT '관리자 여부', 
    mb_point       int    NULL COMMENT '리워드포인트', 
     PRIMARY KEY (mb_id)
);


CREATE TABLE chattings(
    chat_seq INT AUTO_INCREMENT, 
 mb_id VARCHAR(30) NOT NULL,
    chat_user VARCHAR(2000) NULL, 
    chat_chatbot VARCHAR(2000) NULL,
    chat_date DATETIME DEFAULT NOW(), 
     PRIMARY KEY (chat_seq),
FOREIGN KEY(mb_id) references members(mb_id)
);
 select * from challenges;
CREATE TABLE challenges( -- 도전할 목록들을 저장한 테이블 _EJ
    ch_seq INT AUTO_INCREMENT, 
    ch_title VARCHAR(150) NOT NULL, 
    ch_time INT NOT NULL, 
    ch_content VARCHAR(2000) NOT NULL, 
    ch_img1 VARCHAR(2000) NULL, 
    ch_img2 VARCHAR(2000) NULL, 
    ch_reward INT NOT NULL, 
    ch_kind INT NOT NULL,

SET foreign_key_checks = 0;
alter table members modify column mb_joindate DATETIME NOT NULL default now() COMMENT '가입 일자';
SET foreign_key_checks = 1;


/

ALTER TABLE members COMMENT '회원 정보';
/


CREATE TABLE mychallenges(
    mc_seq INT AUTO_INCREMENT, 
    ch_seq INT NOT NULL, 
    mb_id VARCHAR(30) NOT NULL, 
    mc_success INT NOT NULL, 
    mc_start DATETIME DEFAULT NOW(), 
    mc_end DATE NOT NULL, 
     PRIMARY KEY (mc_seq),
FOREIGN KEY(ch_seq) references challenges(ch_seq),
FOREIGN KEY(mb_id) references members(mb_id)
CREATE TABLE chattings
(
    chat_seq            int     NOT NULL  auto_increment   COMMENT '채팅 순번', 
    mb_id               VARCHAR(30)      NOT NULL COMMENT '회원 아이디', 
    chat_user          VARCHAR(2000)    NULL COMMENT '회원 채팅', 
    chat_chatbot        VARCHAR(2000)    NULL COMMENT '챗봇 채팅', 
    chat_emotion           VARCHAR(150)     NULL COMMENT '대화내용 구분', 
    chat_date       	DATETIME              NULL COMMENT '대화 일자', 
     PRIMARY KEY (chat_seq)
);

/

CREATE TABLE mychalleges
(
    mc_seq        int    NOT NULL  auto_increment  COMMENT '진행 도전순번', 
    mb_id         VARCHAR(30)     NOT NULL COMMENT '회원 아이디', 
    ch_seq        int    NOT NULL COMMENT '도전 순번', 
    reg_date      DATETIME             NULL COMMENT '작성 일자', 
    success_yn    VARCHAR(1)      NULL COMMENT '성공 여부', 
     PRIMARY KEY (mc_seq)
);
/

ALTER TABLE mychalleges
    ADD CONSTRAINT FK_mychalleges_ch_seq_challeng FOREIGN KEY (ch_seq)
        REFERENCES challenges (ch_seq);
/

<<<<<<< HEAD
--트리거 : 하루하루 도전이 쌓여 전체 도전의 80퍼 달성 성공시 mychallenges의 mc_success의 값이 1로 바뀌는 트리거!_EJ
CREATE TRIGGER updatesuccess
AFTER INSERT
ON submissions FOR EACH ROW
BEGIN
update mychallenges set sub_result =1 where (select count(sub_seq) from submissions where mc_seq =new.mc_seq and sub_result =1)>=11 and mc_seq=new.mc_seq;  -- trigger 문법
END
=======
ALTER TABLE mychalleges
    ADD CONSTRAINT FK_mychalleges_mb_id_members_m FOREIGN KEY (mb_id)
        REFERENCES members (mb_id);
/
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-4/CESCO.git

insert into mycalendar(mood_date, mood_type, wordcloud, mb_id) values ('2021-10-4', 2 , '', '123')
insert into submissions(mc_seq, mb_id, sub_result, sub_img) values (33,'123',0,'imggg.jpg')

insert into mycalendar(mood_date, mood_type, wordcloud, mb_id) values ('2021-11-1', 0 , '123_0.png', '123');
insert into mycalendar(mood_date, mood_type, wordcloud, mb_id) values ('2021-11-2', 1 , '123_1.png', '123');
insert into mycalendar(mood_date, mood_type, wordcloud, mb_id) values ('2021-11-3', 2 , '123_2.png', '123');
select * from mycalendar;
CREATE TABLE mycalendars
(
    mood_seq         int    NOT NULL  auto_increment   COMMENT '감정 순번', 
    mood_date        DATETIME             NOT NULL COMMENT '작성 일자', 
    mood_type        VARCHAR(30)     NOT NULL COMMENT '감정 종류', 
    mood_imoticon    VARCHAR(150)    NOT NULL COMMENT '감정 이모티콘', 
    mb_id            VARCHAR(30)     NULL COMMENT '회원 아이디', 
     PRIMARY KEY (mood_seq)
);
/
ALTER TABLE mycalendars COMMENT '나의 감정 달력';
/
select *  from mycalendar WHERE DATE_FORMAT(mood_date, '%Y-%m') = '2021-11';


<<<<<<< HEAD
-- 456계정에 감정, wordcloud 삽입해서 테스트 _ EJ
insert into mycalendar(mood_type,wordcloud,mb_id) values(1, 'wordcloud','456');
insert into mycalendar(mood_type,wordcloud,mb_id,mood_date) values(0, 'wordcloud','456', now()+ interval 5 day);
insert into mycalendar(mood_type,wordcloud,mb_id,mood_date) values(2, 'wordcloud','456',now()+interval 10 day);
=======
ALTER TABLE mycalendars
    ADD CONSTRAINT FK_mycalendars_mb_id_members_m FOREIGN KEY (mb_id)
        REFERENCES members (mb_id);
/
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-4/CESCO.git

<<<<<<< HEAD
-- admin계정 추가 _거누님
=======
insert into mycalender(mood_type, wordcloud, mb_id) values(1,"wordcloud","123");
select * from mycalendar;
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-4/CESCO.git
insert into members(mb_id, mb_pwd, mb_gender, mb_age, mb_job, mb_email, mb_nickname,admin_yn) 
		values ('admin1','123','N', 0,'admin', 'admin@admin.com', 'admin',1);
		
select * from mycalendar;
delete from mycalendar where mood_seq = 44
delete from mycalendar;
		
		
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(1,"wordcloud","123",now()-interval 7 day);
delete from mycalendar where mood_seq = 19;
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(2,"wordcloud","123",now()+interval 1 day);		
		
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(3,"wordcloud","123",now()+interval 2 day);		
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(1,"wordcloud","123",now()+interval 3 day);	

insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(1,"wordcloud","123",now()+interval 5 day);		
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(3,"wordcloud","123",now()+interval 6 day);				
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(0,"wordcloud","123",now()+interval 10 day);				
		
		
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(0,"wordcloud","quakka",now()+interval 10 day);				
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(0,"wordcloud","quakka",now());
insert into mycalendar(mood_type, wordcloud, mb_id, mood_date) values(0,"wordcloud","quakka",now()+interval 1 day);


CREATE TABLE mypreferences
( mpref_seq      int    NOT NULL COMMENT '나의 성향 순번', 
    mb_id          VARCHAR(30)     NOT NULL COMMENT '회원 아이디', 
    pref_seq       int    NOT NULL COMMENT '성향 순번', 
    user_answer    VARCHAR(150)    NOT NULL COMMENT '회원 선택 응답', 
     PRIMARY KEY (mpref_seq)
);
/
ALTER TABLE mypreferences COMMENT '나의 성향 정보';
/

ALTER TABLE mypreferences
    ADD CONSTRAINT FK_mypreferences_mb_id_members FOREIGN KEY (mb_id)
        REFERENCES members (mb_id);
/

select * from members;
select * from chattings;
select @@global.time_zone, @@session.time_zone,@@system_time_zone;
select now();
SET GLOBAL time_zone='+09:00';
SET time_zone='+09:00';
select @@system_time_zone;
set time_zone = 'Asia/Seoul';
set global time_zone =GMT;

select count(*) from mysql.time_zone;

<<<<<<< HEAD
-- 감정갯수 카운팅 sql _EJ
select 
count(case when mood_type = 0 then 1 end) as emotion0,
count(case when mood_type = 1 then 1 end) as emotion1,
count(case when mood_type = 2 then 1 end) as emotion2
from mycalendar where mb_id = 'quakka';

select * from mycalendar;

=======
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-4/CESCO.git
delete from chattings 

select 
       count(case when c.ch_kind = 1 then 1 end) as kind1,
      count(case when c.ch_kind = 2 then 1 end) as kind2,
      count(case when c.ch_kind = 3 then 1 end) as kind3
      from mychallenges m, challenges c
       where c.ch_seq=m.ch_seq
       and m.mb_id='456'
       
select count(case when c.ch_kind = 1 then 1 end) as kind1,
      count(case when c.ch_kind = 2 then 1 end) as kind2,
      count(case when c.ch_kind = 3 then 1 end) as kind3
select m.mb_id, c.ch_kind from mychallenges m, challenges c where c.ch_seq=m.ch_seq and m.mb_id='456'

<<<<<<< HEAD

-- 소연씌가 xml에서 쓴 조인 sql 가져와봄 _ EJ
select m.mc_seq from mychallenges m, challenges c, submission s
	      where m.mb_id=#{mb_id}
	      and  now() < m.mc_end
	      and c.ch_seq=m.ch_seq
	      order by m.mc_start desc;
	      
select count(mc_seq) from mychallenges where ch_seq = 1
--statics.jsp에 도전여부 / 달성여부에 표시할 값들 sql로 뽑기 테스트함_EJ
select count(ch_seq) from mychallenges where mb_id = "123" and ch_seq=1 and mc_success=0
select count(mc_seq) from mychallenges where mc_success=1 and ch_seq = ${vo.ch_seq}
select count(mc_seq) from mychallenges where ch_seq = ${vo.ch_seq}
select * from mychallenges;
select * from challenges;
delete from submissions 
delete from mychallenges where mb_id="123"
select mb_id, ch_seq from mychallenges where mb_id="123" and mc_success = "0";
select count(ch_seq) from mychallenges where mb_id="123" and ch_seq=1 and mc_success = "0";

=======
select 
      count(case when ch_kind = 1 then 1 end) as kind1,
      count(case when ch_kind = 2 then 1 end) as kind2,
      count(case when ch_kind = 3 then 1 end) as kind3
      from mycalendar
       where mb_id = #{mb_id}
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-4/CESCO.git
