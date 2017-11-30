package moviestar.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import moviestar.common.common.ArgumentMap;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {

	//컨트롤러의 파라미터가 ArgumentMap 클래스인지 확인
	@Override
    public boolean supportsParameter(MethodParameter parameter) {
        return ArgumentMap.class.isAssignableFrom(parameter.getParameterType());
    }
	
	//request에 담겨있는 키/값을 ArgumentMap에 저장
	@Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		ArgumentMap argumentMap = new ArgumentMap();
         
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        Enumeration<?> enumeration = request.getParameterNames();
         
        String key = null;
        String[] values = null;
        while(enumeration.hasMoreElements()){
            key = (String) enumeration.nextElement();
            values = request.getParameterValues(key);
            if(values != null){
            	argumentMap.put(key, (values.length > 1) ? values:values[0] );
            }
        }
        return argumentMap;
    }
	
}
