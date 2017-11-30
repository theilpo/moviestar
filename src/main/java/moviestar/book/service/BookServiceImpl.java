package moviestar.book.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import moviestar.book.dao.BookDAO;
import moviestar.point.dao.PointDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("bookService")
public class BookServiceImpl implements BookService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bookDAO")
	private BookDAO	bookDAO;

	@Resource(name="pointDAO")
	private PointDAO pointDAO;
	
	@Override
	public List<Map<String, Object>> getSeatList(Map<String, Object> map) throws Exception {
		return bookDAO.selectSeatList(map);
	}

	@Override
	public void insertBook(Map<String, Object> map) throws Exception {
		
		//예매번호 생성(현재시간+난수)
		Calendar cal= Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    String currentTime = sdf.format(cal.getTime());
	    Random random = new Random();
	    int randomNumber = random.nextInt(100) + 1;
	    String bookNo = currentTime + "-" + randomNumber;
	    map.put("BOOK_NO", bookNo);
	    	    
	    //예매정보 저장
		bookDAO.insertBook(map);
		
		//포인트 사용
		int point = Integer.parseInt(map.get("DISCNT_CHARGE").toString());
		if(point > 0) {
			pointDAO.insertPointByBook(map);
		}
		
		//좌석 수정
		String[] SEATS_NO = map.get("SEATS_NO").toString().split(", ");
		for(int i=0; i<SEATS_NO.length; i++) {
			map.put("SEAT_NO", SEATS_NO[i]);
			bookDAO.updateSeat(map);
		}
	}

	@Override
	public void cancleBook(Map<String, Object> map) throws Exception {
		
		//예매상태 변경
		bookDAO.cancleBook(map);
		
		//포인트 반환
		int point = Integer.parseInt(map.get("USE_POINT").toString());
		if(point > 0) {
			pointDAO.insertPointByBookCancle(map);
		}
		
		//좌석 수정
		String[] SEATS_NO = map.get("SEATS_NO").toString().split(", ");
		for(int i=0; i<SEATS_NO.length; i++) {
			map.put("SEAT_NO", SEATS_NO[i]);
			bookDAO.updateSeat(map);
		}
	}

	@Override
	public Map<String, Object> getBookInfo(Map<String, Object> map) throws Exception {
		return bookDAO.getBookInfo(map);
	}
	
}
