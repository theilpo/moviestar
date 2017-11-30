package moviestar.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/***********************************************
 * LoggerInterceptor							
 * 					 
 * : DispatcherServlet 이 컨트롤러 호출 하기 전후에  
 *   요청,응답을 가로채서 로그를 출력
 * 							 	
 ***********************************************/
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	
	//Log 객체 생성
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	//전처리기 : 컨트롤러 호출 전 실행
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("======================================          START         ======================================");
            log.debug(" Request URI \t:  " + request.getRequestURI());
        }
        return super.preHandle(request, response, handler);
    }
	
    //후처리기 : 컨트롤러 호출 후 실행
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("======================================           END          ======================================\n");
        }
    }

}
