package dust2.backend.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtils {
    private static final Logger log = LoggerFactory.getLogger(DateUtils.class);

    public static String getToday() {
        LocalDateTime localDateTime = LocalDateTime.now();

        //자정에서 오전 다섯시 사이에는 전 날의 날짜를 반환한다.
        if(localDateTime.getHour()<5) {
            localDateTime = localDateTime.minusDays(1);
        }

        return localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

}
