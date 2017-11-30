/***************************************      TB_MEMBER     ******************************************/
CREATE TABLE TB_MEMBER
(
    ID VARCHAR2(12) PRIMARY KEY,
    PASSWORD VARCHAR2(12) NOT NULL,
    NAME_KO VARCHAR2(30) NOT NULL,
    NAME_EN VARCHAR2(30),
    BIRTH_DT NUMBER NOT NULL,
    GENDER VARCHAR2(1) NOT NULL,
    EMAIL VARCHAR2(40) NOT NULL,
    TEL VARCHAR2(12),
    PHONE VARCHAR2(13) NOT NULL,
    GENRE VARCHAR2(60) NOT NULL,
    MEM_GB VARCHAR2(1) DEFAULT 'M' NOT NULL,
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL
);
  
COMMENT ON TABLE TB_MEMBER IS '회원';

COMMENT ON COLUMN TB_MEMBER.ID IS '아이디';
COMMENT ON COLUMN TB_MEMBER.PASSWORD IS '비밀번호';
COMMENT ON COLUMN TB_MEMBER.NAME_KO IS '성명';
COMMENT ON COLUMN TB_MEMBER.NAME_EN IS '성명(영문)';
COMMENT ON COLUMN TB_MEMBER.BIRTH_DT IS '생년월일';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '성별'; /* M : 남자, F : 여자 */
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN TB_MEMBER.TEL IS '자택전화번호';
COMMENT ON COLUMN TB_MEMBER.PHONE IS '휴대전화번호';
COMMENT ON COLUMN TB_MEMBER.GENRE IS '선호장르';
COMMENT ON COLUMN TB_MEMBER.MEM_GB IS '회원구분'; /* M : 회원, A : 관리자 */
COMMENT ON COLUMN TB_MEMBER.DEL_GB IS '삭제구분'; /* Y : 삭제, N : 일반   */
/********************************************************************************************************/


/***************************************      TB_NOTICE     ******************************************/
CREATE TABLE TB_NOTICE
(
    IDX NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENTS VARCHAR2(4000) NOT NULL,
    HIT_CNT NUMBER NOT NULL,
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,
    CREA_DTM DATE DEFAULT SYSDATE NOT NULL,
    CREA_ID VARCHAR2(30) NOT NULL
);
  
COMMENT ON TABLE TB_NOTICE IS '공지사항';

COMMENT ON COLUMN TB_NOTICE.IDX IS '공지사항 번호';
COMMENT ON COLUMN TB_NOTICE.TITLE IS '제목';
COMMENT ON COLUMN TB_NOTICE.CONTENTS IS '내용';
COMMENT ON COLUMN TB_NOTICE.HIT_CNT IS '조회수';
COMMENT ON COLUMN TB_NOTICE.DEL_GB IS '삭제구분';
COMMENT ON COLUMN TB_NOTICE.CREA_DTM IS '생성일자';
COMMENT ON COLUMN TB_NOTICE.CREA_ID IS '생성자 ID';

/* TB_NOTICE_SEQ */
CREATE SEQUENCE SEQ_TB_NOTICE_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_REQUEST     ******************************************/
CREATE TABLE TB_REQUEST
(
    IDX NUMBER PRIMARY KEY,
    PARENT_IDX NUMBER,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENTS VARCHAR2(4000) NOT NULL,
    REQ_ID VARCHAR2(30),
    REQ_DTM DATE,
    ANSWER_ID VARCHAR2(30),
    ANSWER_DTM DATE,
    ANSWER_GB VARCHAR2(1)
);
  
COMMENT ON TABLE TB_REQUEST IS '고객문의';

COMMENT ON COLUMN TB_REQUEST.IDX IS '인덱스';
COMMENT ON COLUMN TB_REQUEST.PARENT_IDX IS '부모글 인덱스';
COMMENT ON COLUMN TB_REQUEST.TITLE IS '제목';
COMMENT ON COLUMN TB_REQUEST.CONTENTS IS '내용';
COMMENT ON COLUMN TB_REQUEST.REQ_ID IS '신청자 ID';
COMMENT ON COLUMN TB_REQUEST.REQ_DTM IS '신청일자';
COMMENT ON COLUMN TB_REQUEST.ANSWER_ID IS '답변자 ID';
COMMENT ON COLUMN TB_REQUEST.ANSWER_DTM IS '답변일자';
COMMENT ON COLUMN TB_REQUEST.ANSWER_GB IS '답변상태';

/* TB_REQUEST_SEQ */
CREATE SEQUENCE SEQ_TB_REQUEST_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_EVENT     ******************************************/
CREATE TABLE TB_EVENT
(
    IDX NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100) NOT NULL,
    START_DT DATE NOT NULL,
    END_DT DATE NOT NULL,
    POINT NUMBER NOT NULL,
    CONTENTS VARCHAR2(4000) NOT NULL
);
  
COMMENT ON TABLE TB_EVENT IS '이벤트';

COMMENT ON COLUMN TB_EVENT.IDX IS '이벤트 번호';
COMMENT ON COLUMN TB_EVENT.TITLE IS '제목';
COMMENT ON COLUMN TB_EVENT.START_DT IS '시작일';
COMMENT ON COLUMN TB_EVENT.END_DT IS '종료일';
COMMENT ON COLUMN TB_EVENT.POINT IS '적립금';
COMMENT ON COLUMN TB_EVENT.CONTENTS IS '내용';

/* TB_EVENT_SEQ */
CREATE SEQUENCE SEQ_TB_EVENT_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_FILE     ******************************************/
CREATE TABLE TB_FILE
(
  IDX NUMBER,
  BOARD_GB VARCHAR2(1 BYTE) NOT NULL,
  BOARD_IDX NUMBER NOT NULL,
  ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL,
  STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL,
  FILE_SIZE NUMBER,
  FILE_ORDER NUMBER,
  CREA_DTM DATE DEFAULT SYSDATE NOT NULL,
  CREA_ID VARCHAR2(30 BYTE) NOT NULL,
  DEL_GB VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL,
  PRIMARY KEY (IDX)
);

COMMENT ON TABLE TB_FILE IS '파일';

COMMENT ON COLUMN TB_FILE.IDX IS '인덱스';
COMMENT ON COLUMN TB_FILE.BOARD_GB IS '게시판 구분';	/* M : 영화, T : 영화관, E : 이벤트 */
COMMENT ON COLUMN TB_FILE.BOARD_IDX IS '게시글 인덱스';
COMMENT ON COLUMN TB_FILE.ORIGINAL_FILE_NAME IS '원본제목';
COMMENT ON COLUMN TB_FILE.STORED_FILE_NAME IS '저장제목';
COMMENT ON COLUMN TB_FILE.FILE_SIZE IS '파일크기';
COMMENT ON COLUMN TB_FILE.FILE_ORDER IS '파일순서';
COMMENT ON COLUMN TB_FILE.CREA_DTM IS '생성일자';
COMMENT ON COLUMN TB_FILE.CREA_ID IS '생성자 ID';
COMMENT ON COLUMN TB_FILE.DEL_GB IS '삭제구분';

/* TB_FILE_SEQ */
CREATE SEQUENCE SEQ_TB_FILE_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/
  

/***************************************      TB_MOVIE     ******************************************/
CREATE TABLE TB_MOVIE
(
    MOVIE_NO NUMBER PRIMARY KEY,
    MOVIE_NAME VARCHAR2(100) NOT NULL,
    GENRE VARCHAR2(50) NOT NULL,
    PLAY_DT DATE NOT NULL,
    DIRECTOR VARCHAR2(30) NOT NULL,
    ACTOR VARCHAR2(100) NOT NULL,
    GRADE VARCHAR2(4) NOT NULL,
    RUN_TIME NUMBER(3) NOT NULL,
    PREVIEW_URL VARCHAR2(100) NOT NULL,
    CONTENTS VARCHAR2(4000) NOT NULL
);
  
COMMENT ON TABLE TB_MOVIE IS '영화';

COMMENT ON COLUMN TB_MOVIE.MOVIE_NO IS '영화번호';
COMMENT ON COLUMN TB_MOVIE.MOVIE_NAME IS '영화명';
COMMENT ON COLUMN TB_MOVIE.GENRE IS '장르';
COMMENT ON COLUMN TB_MOVIE.PLAY_DT IS '개봉일';
COMMENT ON COLUMN TB_MOVIE.DIRECTOR IS '감독';
COMMENT ON COLUMN TB_MOVIE.ACTOR IS '출연진';
COMMENT ON COLUMN TB_MOVIE.GRADE IS '등급';
COMMENT ON COLUMN TB_MOVIE.RUN_TIME IS '상영시간';
COMMENT ON COLUMN TB_MOVIE.PREVIEW_URL IS '동영상URL';
COMMENT ON COLUMN TB_MOVIE.CONTENTS IS '줄거리/상세내용';

/* TB_MOVIE_SEQ */
CREATE SEQUENCE SEQ_TB_MOVIE_MOVIE_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_COMMENT     ******************************************/
CREATE TABLE TB_COMMENT
(
    COMMENT_NO NUMBER PRIMARY KEY,
    MOVIE_NO NUMBER NOT NULL,
    STAR_POINT NUMBER NOT NULL,
    CONTENTS VARCHAR2(200) NOT NULL,
    CREA_ID VARCHAR2(30) NOT NULL,
    CREA_DTM DATE DEFAULT SYSDATE NOT NULL
);
  
COMMENT ON TABLE TB_COMMENT IS '한줄평';

COMMENT ON COLUMN TB_COMMENT.COMMENT_NO IS '한줄평 번호';
COMMENT ON COLUMN TB_COMMENT.MOVIE_NO IS '영화 번호';
COMMENT ON COLUMN TB_COMMENT.STAR_POINT IS '별점';
COMMENT ON COLUMN TB_COMMENT.CONTENTS IS '내용';
COMMENT ON COLUMN TB_COMMENT.CREA_ID IS '작성자';
COMMENT ON COLUMN TB_COMMENT.CREA_DTM IS '작성일';

/* TB_COMMENT_SEQ */
CREATE SEQUENCE SEQ_TB_COMMENT_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_THEATER     ******************************************/
CREATE TABLE TB_THEATER
(
    THEATER_NO NUMBER PRIMARY KEY,
    THEATER_NAME VARCHAR2(30) NOT NULL,
    TEL VARCHAR2(12) NOT NULL,
    REGION VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL,
    LAT VARCHAR2(20) NOT NULL,
    LNG VARCHAR2(20) NOT NULL,
    CONTENTS VARCHAR2(4000) NOT NULL
);
  
COMMENT ON TABLE TB_THEATER IS '극장';

COMMENT ON COLUMN TB_THEATER.THEATER_NO IS '극장번호';
COMMENT ON COLUMN TB_THEATER.THEATER_NAME IS '극장명';
COMMENT ON COLUMN TB_THEATER.TEL IS '전화번호';
COMMENT ON COLUMN TB_THEATER.REGION IS '지역';
COMMENT ON COLUMN TB_THEATER.ADDRESS IS '주소';
COMMENT ON COLUMN TB_THEATER.LAT IS '위도';
COMMENT ON COLUMN TB_THEATER.LNG IS '경도';
COMMENT ON COLUMN TB_THEATER.CONTENTS IS '내용';

/* TB_THEATER_SEQ */
CREATE SEQUENCE SEQ_TB_THEATER_THEATER_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_HALL     ******************************************/
CREATE TABLE TB_HALL
(
    HALL_NO NUMBER PRIMARY KEY,
    HALL_NAME VARCHAR2(10) NOT NULL,
    SEAT_CNT NUMBER NOT NULL,
    THEATER_NO NUMBER CONSTRAINT TB_HALL_THEATER_NO_FK REFERENCES TB_THEATER(THEATER_NO) ON DELETE CASCADE
);
  
COMMENT ON TABLE TB_HALL IS '상영관';

COMMENT ON COLUMN TB_HALL.HALL_NO IS '상영관 번호';
COMMENT ON COLUMN TB_HALL.HALL_NAME IS '상영관 이름';
COMMENT ON COLUMN TB_HALL.SEAT_CNT IS '좌석수';
COMMENT ON COLUMN TB_HALL.THEATER_NO IS '극장 번호';

/* TB_HALL_SEQ */
CREATE SEQUENCE SEQ_TB_HALL_HALL_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_TIME     ******************************************/
CREATE TABLE TB_TIME
(
    TIME_NO NUMBER PRIMARY KEY,
    SHOW_DT DATE NOT NULL,
    START_TIME VARCHAR2(5) NOT NULL,
    END_TIME VARCHAR2(5) NOT NULL,
    MOVIE_NO NUMBER CONSTRAINT TB_TIME_MOVIE_NO_FK REFERENCES TB_MOVIE(MOVIE_NO) ON DELETE CASCADE,
    THEATER_NO NUMBER CONSTRAINT TB_TIME_THEATER_NO_FK REFERENCES TB_THEATER(THEATER_NO) ON DELETE CASCADE,
    HALL_NO NUMBER CONSTRAINT TB_TIME_HALL_NO_FK REFERENCES TB_HALL(HALL_NO) ON DELETE CASCADE
);
  
COMMENT ON TABLE TB_TIME IS '상영시간';

COMMENT ON COLUMN TB_TIME.TIME_NO IS '상영시간 번호';
COMMENT ON COLUMN TB_TIME.SHOW_DT IS '상영일';
COMMENT ON COLUMN TB_TIME.START_TIME IS '시작시간';
COMMENT ON COLUMN TB_TIME.END_TIME IS '종료시간';
COMMENT ON COLUMN TB_TIME.MOVIE_NO IS '영화번호';
COMMENT ON COLUMN TB_TIME.THEATER_NO IS '극장번호';
COMMENT ON COLUMN TB_TIME.HALL_NO IS '상영관번호';

/* TB_TIME_SEQ */
CREATE SEQUENCE SEQ_TB_TIME_TIME_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/***************************************      TB_SEAT     ******************************************/
CREATE TABLE TB_SEAT
(
    SEAT_NO VARCHAR2(3) NOT NULL,
    USEABLE VARCHAR2(1) DEFAULT 'Y' NOT NULL,
    TIME_NO NUMBER CONSTRAINT TB_SEAT_TIME_NO_FK REFERENCES TB_TIME(TIME_NO) ON DELETE CASCADE
);

COMMENT ON TABLE TB_SEAT IS '좌석';

COMMENT ON COLUMN TB_SEAT.SEAT_NO IS '좌석번호';
COMMENT ON COLUMN TB_SEAT.USEABLE IS '사용가능여부';
COMMENT ON COLUMN TB_SEAT.TIME_NO IS '상영시간 번호';
/********************************************************************************************************/


/***************************************      TB_BOOK     ******************************************/
CREATE TABLE TB_BOOK
(
    BOOK_NO VARCHAR2(30) PRIMARY KEY,    
    PEOPLE VARCHAR2(40) NOT NULL,
    SEATS_NO VARCHAR2(100) NOT NULL,
    USE_POINT NUMBER NOT NULL,
    CHARGE NUMBER NOT NULL,
    BOOK_ID VARCHAR2(30) NOT NULL,
    BOOK_DT DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'R' NOT NULL,    
    TIME_NO NUMBER CONSTRAINT TB_BOOK_TIME_NO_FK REFERENCES TB_TIME(TIME_NO) ON DELETE CASCADE
);
  
COMMENT ON TABLE TB_BOOK IS '예매';

COMMENT ON COLUMN TB_BOOK.BOOK_NO IS '예매번호';
COMMENT ON COLUMN TB_BOOK.PEOPLE IS '예매인원';
COMMENT ON COLUMN TB_BOOK.SEATS_NO IS '예매좌석';
COMMENT ON COLUMN TB_BOOK.USE_POINT IS '사용포인트';
COMMENT ON COLUMN TB_BOOK.CHARGE IS '결제요금';
COMMENT ON COLUMN TB_BOOK.BOOK_ID IS '예매ID';
COMMENT ON COLUMN TB_BOOK.BOOK_DT IS '예매일'; 
COMMENT ON COLUMN TB_BOOK.STATUS IS '예매상태'; /* R : 예매, C : 예매취소 */
COMMENT ON COLUMN TB_BOOK.TIME_NO IS '상영시간 번호';
/********************************************************************************************************/


/***************************************      TB_POINT     ******************************************/
CREATE TABLE TB_POINT
(
    POINT_NO NUMBER PRIMARY KEY,
    DETAILS VARCHAR2(50) NOT NULL,
    POINT NUMBER NOT NULL,
    TOT_POINT NUMBER NOT NULL,
    POINT_DT DATE NOT NULL,
    POINT_ID VARCHAR2(12) NOT NULL,
    EVENT_NO NUMBER CONSTRAINT TB_POINT_EVENT_NO_FK REFERENCES TB_EVENT(IDX) ON DELETE CASCADE
);
  
COMMENT ON TABLE TB_POINT IS '포인트';

COMMENT ON COLUMN TB_POINT.POINT_NO IS '포인트 번호';
COMMENT ON COLUMN TB_POINT.DETAILS IS '포인트 상세내역';
COMMENT ON COLUMN TB_POINT.POINT IS '포인트';
COMMENT ON COLUMN TB_POINT.TOT_POINT IS '총 포인트';
COMMENT ON COLUMN TB_POINT.POINT_DT IS '등록일자';
COMMENT ON COLUMN TB_POINT.POINT_ID IS '아이디';
COMMENT ON COLUMN TB_POINT.EVENT_NO IS '이벤트 번호';

/* TB_POINT_SEQ */
CREATE SEQUENCE SEQ_TB_POINT_POINT_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
/********************************************************************************************************/


/* 관리자 계정 추가 */
INSERT INTO TB_MEMBER(ID, PASSWORD, NAME_KO, BIRTH_DT, GENDER, EMAIL, PHONE, GENRE, MEM_GB, DEL_GB)
VALUES('admin', 'admin', '관리자', '19890125', 'M', 'admin@moviestar.com', '010-1234-5678', '코미디', 'A', 'N');
INSERT INTO TB_POINT(POINT_NO, DETAILS, POINT, TOT_POINT, POINT_DT, POINT_ID)
VALUES(SEQ_TB_POINT_POINT_NO.NEXTVAL, '회원가입', 1000, 1000, SYSDATE, 'admin');

/* 공지사항 추가 */
INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '[소풍] 부천시박물관 체험 패키지 일정 안내', 
'부천시박물관과 함께하는 체험 패키지 12월 일정 안내드립니다.<br />
<br />
1. 12월 10일(토)<br />
- 14시 : <손발 척척 자 만들기> 체험 진행<br />
- 15시 : <아기배달부 스토크> 영화 관람<br />
<br />
2. 12월 17일(토)<br />
- 14시 : <손발 척척 자 만들기> 체험 진행<br />
- 15시 : <스노우 타임> 영화 관람<br />
<br />
3. 12월 28일 (수)<br />
- 14시 : <반짝반짝 색모래> 체험 진행<br />
- 15시 : <루돌프와 많이 있어> 영화 관람<br />
<br />
# 접수 방법<br />
- CGV소풍 매표소 현장 접수<br />
- CGV홈페이지 고객센터 이메일 문의 접수<br />
<br />
# 매 타임 선착순 20명 한정 접수되며, 패키지 프로그램에 참여한 모든분께 미니팝콘 제공됩니다.<br />
# 패키지 가격 : 9,000원<br />
# 패키지 진행 후 부분 환불은 불가합니다.<br />
# 패키지 프로그램과 영화는 변경될 수 있습니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '홈티켓 서비스 종료안내드립니다.', 
'안녕하세요 CGV입니다.<br />
그동안 CGV 홈페이지를 통해 예매하신 고객님을 대상으로 제공되던<br />
홈티켓 서비스가 2016년 12월 27일 종료됩니다.<br />
<br />
기존의 홈티켓 서비스는 종료되지만 예매 완료 화면 하단에 있는 예매내역 인쇄 서비스를<br /> 
이용해서 인쇄하신 화면을 박스오피스에 제시하시거나 극장 로비에 비치된 티켓판매기에<br /> 
예매번호를 입력하시면 입장 티켓을 발권 받으실 수 있습니다.<br />
<br /> 
이용에 참고 부탁드립니다.<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '[순천] 12/9(금) 조조 대관 행사로 인한 일부 회차 예매 불가 안내', 
'안녕하십니까. 순천점 입니다.<br />
 <br />
12/09(금) 진행되는 조조 단체 관람으로 인하여<br />
오전 10시대 일부 영화 예매가 불가하오니 이용에 착오 없으시길 바랍니다.<br />
자세한 내용은 당일 상영시간표를 참고해주시기 바랍니다.<br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '12/19(화) 주차장 이용 불가 안내 (주차장 환경개선)', 
'안녕하십니까, CGV 피카디리1958 입니다.<br />
CGV피카디리1958을 이용해주시는 고객님들께 감사말씀드립니다.<br />
 <br />
12/19(화) 입점 건물 주차장 환경 개선 활동으로 인한<br />
주차장 이용 통제 예정 공지드립니다.<br />
 <br />
 해당일 주차장 사용이 제한되오니<br />
 불편하시겠지만 대중교통을 이용 부탁드립니다.<br />
 <br />
 감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, ' 12/10(토) 교통통제 안내', 
'안녕하십니까, CGV대구한일입니다.<br />
12/10(토) 집회 진행으로 주변 교통 및 주차장 진입이 통제됩니다.<br />
대중교통 이용 부탁드립니다.<br />
감사합니다.<br />
통제구간 : 공평네거리 ~ 국회보상기념공원', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '12/12(월) 24시간 미운영 안내', 
'안녕하세요, CGV 강남입니다.<br />
 <br />
12/12일(월)~13일(화) 넘어가는 새벽에 건물 내 정전 점검 작업이 예정되어 있어 24시간 운영을 하지 않습니다.<br />
<br />
ㆍ2016년 12월 13일(화) 04:00~07:00 (3시간/12일(월)~13일(화) 넘어가는 새벽)<br />
 <br />
ㆍ12/12(월) 마지막 영화 상영 시작 시간 25:20
 <br />
더욱 안정적이고 편리한 서비스를 제공하는 CGV강남이 되겠습니다.<br />
<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '씨네라이브러리 운영시간 변경안내', 
'안녕하세요.<br />
CGV 명동역 씨네라이브러리입니다.<br />
CGV씨네라이브러리운영시간 변경안내 드립니다.<br />
★ 매주월요일휴관<br />
★12/13(화): 12시~18시 30분<br />
★12/16(금): 17시~21시<br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '(시스템점검) 쿠투쿠폰 사용 불가 件', 
'안녕하십니까, CGV입니다.<br />
 <br />
2016년 12월 16일(금) 오전 00시~06시 까지 쿠투쿠폰 시스템점검으로 인하여 사용이 불가합니다.<br />
많은 양해 부탁드립니다.<br />
 <br />
○ 점검일시 : 2016년 12월 16일(금) 00시~06시<br />
○ 사용불가채널 : 현장매표소, 티켓판매기, 홈페이지, 웹, 모바일<br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '[대구현대] 장애인 리프트 사용 안내', 
'안녕하십니까. CGV대구현대입니다.<br />
항상 CGV대구현대를 방문해주시는 고객님께 깊은 감사의 말씀을 드립니다.<br />
현재 장애인 리프트의 부품 수급 지연으로 인해 점검 기간이 지연되고 있어, <br />
고객님의 너그러운 양해를 부탁드립니다.<br />
조속히 정상 운영할 수 있도록 하겠습니다. 감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '[씨네라이브러리] 주차 안내', 
'안녕하세요. CGV명동역씨네라이브러리 입니다.<br />
 <br />
크리스마스 이브와 당일, 연말에는<br />
명동에 많은 고객들로 인하여<br />
주차장 이용에 어려움이 있을 수 있습니다.<br />
가급적 대중교통 이용 부탁드립니다.<br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '2/26 상영중단 및 대피로 인한 환불 안내', 
'2017년 2월 26일(일) 26시 43분경 화재경보 발생으로 인하여, 고객 안전을 위해 대피를 진행하였습니다.<br />
당일 관람 도중 귀가하신 고객님들께 안내드립니다.<br />
3월 31일(금)까지 CGV동탄 매표소로 해당 영화 티켓 지참 후 방문해 주시면 영화관람 또는 환불 안내를 도와드리겠습니다.<br />
추가 문의사항이 있으신 경우 당사 고객 센터 (1544-1122)로 연락 부탁드립니다.<br />
<br />
CGV는 앞으로도 고객님의 안전한 영화 관람 환경을 위해 최선을 다하겠습니다.<br />
감사합니다', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '2/23(목) 영업 재개 안내드립니다.', 
'2017년 2월 23일(목) 오전 10시 30분부터 CGV동탄(센터포인트몰 A블럭 위치) 영업이 재개됩니다. <br />
센터포인트몰 A블럭은 화성 시청 및 경기도 소방본부 합동 점검 결과 유해물질 미검출에 대해 판정을 받았으며, <br />
화성 소방서의 소방 정밀 점검사항에 대한 검토가 완료되어<br />
센터포인트몰 A블럭에 한하여 2017년 2월 23일(목) 오전 10시 30분부터 영업이 재개됩니다.<br />
<br />
덧붙여, 2월 4일(토) 영화 상영 중단으로 관람을 못하신 고객님들께서는 2월 23일(목)부터 3월 31일(금)까지<br />
CGV동탄 매표소로 해당 영화 티켓 지참 후 방문해 주시면 영화관람 또는 환불 안내를 도와 드리겠습니다.<br />
추가 문의사항이 있으신 경우 당사 고객센터(1544-1122)로 연락 부탁드립니다.<br />
 <br />
CGV는 앞으로도 고객님의 안전한 영화 관람 환경을 위해 최선을 다하겠습니다.<br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '행사 예매 취소 규정 변경 안내', 
'CGV를 이용해주시는 고객 여러분께 언제나 감사 드립니다.  <br />
 <br />
일부 ‘행사 프로그램(시네마톡, 라이브톡 등)’의 예매 취소(환불) 규정 변경을 알려드립니다.<br />
 <br />
최근 일부 행사 프로그램의 좌석을 예매한 후 불법판매 또는 직전 취소하는 사례가 급증하여, <br />
참여 기회를 놓친 고객들에게 피해가 발생하고 있습니다. <br />
이에 부득이 일부 ‘행사 프로그램’에 한하여 행사 당일 예매 취소,변경 불가로 예매 취소 규정이 변경되오니,<br />
건강한 예약 문화 정착을 위해 널리 양해 부탁 드립니다.<br />
 <br />
□ 시행일 : 2017년 3월 20일(월)~<br />
 <br />
□ 적용 행사 종류 (※ 적용 행사의 경우 추후 변경될 수 있습니다.)<br />
- 시네마톡, 이동진의 라이브톡(현장), 스타★라이브톡(현장), 영화독서, 아트톡, 월간배우,<br />
라이브러리톡, 스페셜톡, 집중탐구 등<br />
- 북클럽, 공연 실황, 그린 시네마, 모닝 시네마, 스크린 영어, 지식강연 등<br />
※ 단, ‘이동진의 라이브톡’, ‘스타★라이브톡’의 생중계관은 적용 행사에서 제외됩니다.<br />
 <br />
□ 유의사항<br />
- 당일 취소 불가한 행사는 예매 시 별도 안내 문구를 통해 안내되며,<br />
해당 행사의 예매 취소는 전날 23:59까지 가능합니다.<br />
예) 2017년 3월 20일 진행되는 행사의 경우 → 2017년 3월 19일 23:59까지 취소 가능<br />
- 행사 당일 구매한 티켓의 경우 교환/환불이 불가합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '북앤라이프 서비스 점검 공지', 
'안녕하세요. CGV입니다.<br />
북앤라이프 서비스 점검예정으로 안내드립니다.<br />
 <br />
[북앤라이프 서비스 점검 공지]<br />
■ 점검일시 : 2017년 4월 20일(목) 오전 3시 ~ 오전 8시(5시간)<br />
■ 점검내용 : 북앤라이프 4월 시스템 정기점검<br />
■ 점검영향 : 북앤라이프 홈페이지 및 결제 서비스 이용 불가 (도서문화 상품권)<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '[JFF] 영화 시작 시간 안내', 
'안녕하십니까?<br />
언제나 다양한 영화 체험의 기회를 제공하는 CGV입니다.<br />
 <br />
제 2회 JFF 상영 작품의 상영 관련 안내 드립니다.<br />
 <br />
이번 제 2회 JFF의 경우 일반 상영과는 달리 영화제 특별 상영으로 보통의 광고 및 예고편 상영이 없는 관계로<br />
본 영화 시작 시간은 티켓에 표기된 시간에 준하여 정시에 상영됩니다.<br />
이 점 유의하시어 관람에 차질이 없으면 합니다.<br />
 <br />
즐거운 관람되시길 바랍니다.<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '스마트콘 서비스 일시중단 안내', 
'안녕하세요, CGV 입니다.<br />
다름이 아니라, 스마트콘 서버 이관 작업을 위해 스마트콘 서비스 일지중지 및 서버 업데이트 진행 관련하여 안내 드립니다.<br />
하기 작업시간 내 스마트콘 관련 모든 서비스가 일시적으로 중단이 될 예정이오니 참고 부탁드립니다.<br />
 <br />
- 작업일시 : 2017년 03월 21일 (화) 02:00 ~ 10:00<br />
- 작업내용 : 스마트콘 서버 이관작업 및 업데이트 진행<br />
- 중단서비스 : CGV 현장/홈페이지/모바일 APP 內 사용불가 <br /> 
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '5월 정기 시스템 안내', 
'안녕하십니까, CGV 입니다.<br />
원활하고 안정된 서비스 제공을 위하여 5월 23일(화) 새벽 시스템 점검 작업이 예정되어 있습니다.<br />
점검 시간 중 CGV홈페이지 및 모바일의 모든 서비스가 중단될 예정이오니 이용에 불편 없으시기 바랍니다.<br />
1. 일시<br />
ㆍ2017년 5월 23일(화) 02:00~07:00 (5시간)<br />
2. 내용<br />
- 정기 PM작업(시스템 성능 개선 작업) / CGV 극장영업 DB 업데이트, 중계 DB서버 교체<br />
- 작업 대상 : 극장영업시스템, 온라인 서비스(홈페이지/모바일) <br />
더욱 안정적이고 편리한 서비스를 제공하는 CGV가 되겠습니다.<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, 'SKT휴대폰결제 서비스 중단 안내', 
'안녕하세요, CGV입니다.<br />
휴대폰 결제 관련, SKT 시스템 개편으로 아래와 같이 작업 예정이오니 내용 확인하시어 이용에 불편함 없으시기 바랍니다.<br />
감사합니다.<br />
 <br />
○  일시 : 5/13 (토) 02:00 ~ 06:00<br />
○  내용 : SKT 시스템 개편 작업<br />
○  영향 : SKT 휴대폰 소액결제 서비스 중단', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '극장 내 화재경보기 오작동으로 인한 사과 안내', 
'2017년 7월 26일(수) 18시 38분경 시작된 극장 내 화재경보기 오작동으로 인해<br />
관람 중이던 고객님들에게 불편 드린 점 정중히 사과드립니다 .<br />
 <br />
당일 소중한 시간을 내어 방문하신 고객님들께 불편드린 점 다시 한 번 사과 말씀드리며, <br />
향후 고객님들의 편안한 관람이 이루어질 수 있도록 극장 운영과 관리에 더욱 힘쓰겠습니다.<br />
 <br />
추가 문의 사항은 고객센터로 연락 주시길 부탁드리며,<br />
고객님의 안전한 영화 관람 환경을 위해 최선을 다하겠습니다. <br /> 
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, 'CGV용산아이파크몰 GRAND OPEN!', 
'안녕하세요. CGV입니다.<br />
CGV용산아이파크몰 그랜드 오픈 안내드립니다.<br />
 <br />
2017년 7월 18일(화)부터 <br />
CGV용산이 CGV용산아이파크몰로  새롭게 태어납니다.<br />
<br />
Global Landmark Cinema로 도약하는<br />
CGV용산아이파크몰을 위하여 고객님의 많은 관심과 성원 부탁 드립니다.<br />
<br />
It’s New Revolution!<br />
CGV용산아이파크몰의 새로운 변화를 기대해주세요!<br />
<br />
감사합니다', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, 'PREMIUM관 가격다변화 진행', 
'아래와 같이 CGV신촌아트레온 PREMIUM관 신규 서비스 제공에 따라 영화 관람가격이 변경될 예정이오니, <br /> 
이용에 참고 부탁드립니다.<br />
<br />
- 적용일시 : 2017년 7월 17일(월) 상영작부터 적용 <br />
- 적용극장/상영관 : CGV신촌아트레온 / PREMIUM관 <br />
- 적용내용 : <br />
  조조 성인 기존) 15,000원 -> 변경) 20,000원<br />
          청소년 기존) 12,000원 -> 변경) 17,000원 <br />
  일반 성인 기존) 20,000원 -> 변경) 25,000원 <br />
          청소년 기존) 15,000원 -> 변경 20,000원<br />
 <br />
CGV신촌아트레온과 함께하는 쿨이너프스튜디오 브랜드관 런칭으로 <br />
보다 나은 서비스를 제공하는 CGV신촌아트레온이 되겠습니다. <br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '6/30(금) 지점 정비로 인한 휴업 안내', 
'안녕하세요.CGV해운대입니다.<br />
 <br />
6월 30일(금)은 지점 정비로 당일 영화관 운영을 하지 않습니다.<br />
더 나은 서비스와 관람 환경을 위함이오니, 고객님의 너그러운 양해 부탁 드립니다.<br />
6월 30일(금)은 가까운 CGV센텀시티 이용을 부탁 드립니다.<br />
감사합니다.<br />
 <br />
※CGV해운대에서 가까운 CGV<br />
<br />
CGV센텀시티 : 부산광역시 해운대구 우동 1495번지 신세계센텀시티 7층', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '티켓 재판매 공지드립니다.', 
'안녕하세요. CGV입니다.<br />
 <br />
최근 예매 티켓 재판매 행위에 따른 사기 등 각종 피해 사례가 급증하고 있어 고객 여러분들의 각별한 주의가 필요합니다. <br /> 
티켓 재판매자로 적발될 경우 CJ ONE 아이디 사용 제한 및 강제 탈퇴, 예매 내역 취소 등의 조치를 취할 예정입니다. <br />
아울러, 잘못된 경로의 티켓을 구매하지 않는 고객 여러분의 협조가 필요하오니 공식 예매 경로를 통하여 티켓 구매를 부탁드립니다.<br />
 <br />
앞으로도 고객 여러분들의 권리 보호와 티켓 불법 거래 근절을 위해 노력하겠습니다.<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, '8월 정기 시스템 안내', 
'안녕하십니까, CGV 입니다.<br />
원활하고 안정된 서비스 제공을 위하여 8월 22일(화) 새벽 시스템 점검 작업이 예정되어 있습니다.<br />
점검 시간 중 CGV홈페이지 및 모바일의 모든 서비스가 중단될 예정이오니 이용에 불편 없으시기 바랍니다.<br />
 <br />
1. 일시<br />
ㆍ2017년 8월 22일(화) 02:00~07:00 (5시간)<br />
2. 내용<br />
- 정기 PM작업(시스템 성능 개선 작업)<br />
- 작업 대상 : 극장영업시스템, 온라인 서비스(홈페이지/모바일) <br />
 <br />
더욱 안정적이고 편리한 서비스를 제공하는 CGV가 되겠습니다.<br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

INSERT INTO TB_NOTICE(IDX, TITLE, CONTENTS, HIT_CNT, DEL_GB, CREA_DTM, CREA_ID)
VALUES(SEQ_TB_NOTICE_IDX.NEXTVAL, 'YES쿠폰 시스템 점검 진행 (10/27 00:00 ~ 02:00)', 
'YES쿠폰 시스템 정기점검이 진행됨에 따라<br />
해당 점검 기간동안 YES쿠폰 사용이 일시 중단되오니 사용에 유의 부탁드립니다.<br />
 <br />
점검일시 : 2017.10.27 (금) 00:00 ~ 02;:00 (2시간)<br />
               ※ 목요일에서 금요일 넘어가는 새벽<br />
 <br />
점검내용 : YES쿠폰 네트워크 및 시스템 점검<br />
 <br />
중단서비스<br />
 - CGV 현장 매표소/매점 및 홈페이지/모바일APP 등 YES쿠폰 사용 불가<br />
 - YES쿠폰 SMS/LMS/MMS 발송 및 재발송 불가<br />
 - YES쿠폰 웹사이트 이용 불가<br />
 <br />
감사합니다.', 0, 'N', SYSDATE, 'admin');

