package moviestar.time.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.time.dao.TimeDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("timeService")
public class TimeServiceImpl implements TimeService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="timeDAO")
	private TimeDAO timeDao;

	@Override
	public void insertTime(Map<String, Object> map) throws Exception {
		
		String[] startTime = map.get("START_TIME").toString().split(",");
		
		for(int i=0; i<startTime.length; i++) {
			map.put("START_TIME", startTime[i]);
			timeDao.insertTime(map);	//상영시간 등록
			
			/** 상영관 좌석 등록 start **/
			double seatCnt = Double.parseDouble(map.get("SEAT_CNT").toString());
			char ascii  = 65;
			
			//250 좌석 넘으면 A ~ O 열, 적으면 A ~ K 열
			int col     = seatCnt > 250 ? 15 : 11;
			double dRow = seatCnt > 250 ? seatCnt/15.0 : seatCnt/11.0;
			int row     = Integer.parseInt(String.valueOf(Math.round(Math.ceil(dRow))));
			int cnt     = 0;
			
			for(int c=1; c<=col; c++) {
				String str = String.valueOf(ascii);
				String seatNo = "";
				for(int r=1; r<=row; r++) {
					if(cnt == seatCnt) {
						break;
					}
					cnt++;
					seatNo = str + r;
					map.put("SEAT_NO", seatNo);
					timeDao.insertSeat(map);	//상영관 좌석 등록
				}
				ascii++;
			}
			/** 상영관 좌석 등록 end **/
		}
	}

	@Override
	public List<Map<String, Object>> getTimeList(Map<String, Object> map) throws Exception {
		return timeDao.getTimeList(map);
	}
	
}
