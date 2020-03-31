package dust2.backend.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import java.util.List;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class Forecast {
    private String informCause;
    private String informGrade;
    List<String> images;

    public Forecast(String informCause, String informGrade, List<String> images) {
        this.informCause = informCause;
        this.informGrade = informGrade;
        this.images = images;
    }

}
