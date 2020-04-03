package dust2.backend.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.databind.JsonNode;

import java.util.ArrayList;
import java.util.List;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Forecast {
    private String informOverall;
    private String informGrade;
    List<String> images = new ArrayList<>();

    public Forecast(JsonNode todayForecast, List<String> images) {
        this.informOverall = todayForecast.get("informOverall").asText();
        this.informGrade = todayForecast.get("informGrade").asText();
        this.images = images;
    }

    @Override
    public String toString() {
        return "Forecast{" +
                "informOverall='" + informOverall + '\'' +
                ", informGrade='" + informGrade + '\'' +
                ", images=" + images +
                '}';
    }
}
