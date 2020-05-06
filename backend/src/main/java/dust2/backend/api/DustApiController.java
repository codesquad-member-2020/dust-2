package dust2.backend.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import dust2.backend.controller.AirQualityLookUpService;
import dust2.backend.controller.CoordinateConverterService;
import dust2.backend.controller.StationLookUpService;
import dust2.backend.domain.Forecast;
import dust2.backend.util.ForecastApiUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dust2.backend.domain.AirQualityInfo;
import dust2.backend.domain.Coordinate;
import dust2.backend.domain.Station;
import dust2.backend.domain.StationAirQuality;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.URISyntaxException;
import java.io.UnsupportedEncodingException;

@RestController
@RequestMapping("/api")
public class DustApiController {
    private static final Logger log = LoggerFactory.getLogger(DustApiController.class);

    private CoordinateConverterService coordinateConverterService;
    private StationLookUpService stationLookUpService;
    private AirQualityLookUpService airQualityLookUpService;

    public DustApiController(CoordinateConverterService coordinateConverterService, StationLookUpService stationLookUpService, AirQualityLookUpService airQualityLookUpService) {
        this.coordinateConverterService = coordinateConverterService;
        this.stationLookUpService = stationLookUpService;
        this.airQualityLookUpService = airQualityLookUpService;
    }

    @GetMapping("/air-quality")
    public ResponseEntity<StationAirQuality> getAirQualityInfo(@RequestParam(defaultValue = "37.49091104239007") double latitude, @RequestParam(defaultValue = "127.03362369436914") double longitude) {
        try {
            Coordinate coordinate = coordinateConverterService.getCoordinate(latitude, longitude);
            Station station = stationLookUpService.getStation(coordinate);
            AirQualityInfo[] airQualityInfos = airQualityLookUpService.getAirQuality(station.getStationName());
            return ResponseEntity.ok(new StationAirQuality(station, airQualityInfos));
        } catch (JsonProcessingException | UnsupportedEncodingException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    @GetMapping("/forecast")
    public ResponseEntity<Forecast> showForecast() throws JsonProcessingException, URISyntaxException {
        Forecast todayForecast = ForecastApiUtils.getTodayForecastFromOpenApi();
        log.info("todayForecast : {} ", todayForecast);

        return ResponseEntity.ok(todayForecast);
    }
}
