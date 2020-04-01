package dust2.backend.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Forecast {
    private String informCause;
    private String informGrade;
    List<String> images = new ArrayList<>();

    public Forecast(JSONObject todayForecast) {
        this.informCause = todayForecast.getString("informCause");
        this.informGrade = todayForecast.getString("informGrade");
        this.images.add(todayForecast.getString("imageUrl1"));
        this.images.add(todayForecast.getString("imageUrl2"));
        this.images.add(todayForecast.getString("imageUrl3"));
        this.images.add(todayForecast.getString("imageUrl4"));
        this.images.add(todayForecast.getString("imageUrl5"));
        this.images.add(todayForecast.getString("imageUrl6"));
        this.images.add(todayForecast.getString("imageUrl7"));
    }

}
