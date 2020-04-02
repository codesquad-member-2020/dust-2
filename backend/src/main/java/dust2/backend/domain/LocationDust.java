package dust2.backend.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import java.util.ArrayList;
import java.util.List;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class LocationDust {
    private String location;
    private List<Dust> dusts = new ArrayList<>();

    public LocationDust(String location, List<Dust> dusts) {
        this.location = location;
        this.dusts = dusts;
    }
}
