package dust2.backend.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Dust {
    private String dataTime;
    private String pm10Value;
    private String pm10Grade;

    public Dust(String dataTime, String pm10Value, String pm10Grade) {
        this.dataTime = dataTime;
        this.pm10Value = pm10Value;
        this.pm10Grade = pm10Grade;
    }
}
