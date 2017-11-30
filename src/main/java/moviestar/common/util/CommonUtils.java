package moviestar.common.util;

import java.util.UUID;

public class CommonUtils {

	/**
	 * 랜덤문자열을 반환한다.
	 *
	 * @return String.
	 */
	public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
	
	
}
