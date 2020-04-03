package dust2.backend.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import java.util.Arrays;
import java.util.List;

@JsonAutoDetect
public class StationAirQuality {

    private Station station;
    private List<AirQualityInfo> airQualityInfos;

    public StationAirQuality(Station station, AirQualityInfo[] airQualityInfos) {
        this.station = station;
        this.airQualityInfos = Arrays.asList(airQualityInfos);
    }

    public Station getStation() {
        return station;
    }

    public void setStation(Station station) {
        this.station = station;
    }

    public List<AirQualityInfo> getAirQualityInfos() {
        return airQualityInfos;
    }

    public void setAirQualityInfos(AirQualityInfo[] airQualityInfos) {
        this.airQualityInfos = Arrays.asList(airQualityInfos);
    }
}
