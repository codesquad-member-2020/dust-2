package dust2.backend.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import dust2.backend.domain.Dust;
import dust2.backend.domain.Forecast;
import dust2.backend.domain.LocationDust;
import dust2.backend.util.ForecastApiUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class DustApiController {
    private static final Logger log = LoggerFactory.getLogger(DustApiController.class);

    @GetMapping("/forecast")
    public ResponseEntity<Forecast> showForecast() throws JsonProcessingException, URISyntaxException {
        Forecast todayForecast = ForecastApiUtils.getTodayForecastFromOpenApi();
        log.info("todayForecast : {} ", todayForecast);

        return ResponseEntity.ok(todayForecast);
    }

    @GetMapping("/location")
    public LocationDust showLocationDust(@RequestParam("latitude") double latitude, @RequestParam("longtitude") double longtitude) {
        String location = "강남구";
        List<Dust> dusts = new ArrayList<>();

        log.info("latitude :" + latitude + " longtitude :" + longtitude);

        dusts.add(new Dust("2020-03-30 24:00", "35", "2"));
        dusts.add(new Dust("2020-03-30 23:00", "44", "2"));
        dusts.add(new Dust("2020-03-30 22:00", "48", "2"));
        dusts.add(new Dust("2020-03-30 21:00", "42", "2"));
        dusts.add(new Dust("2020-03-30 20:00", "89", "3"));
        dusts.add(new Dust("2020-03-30 19:00", "167", "4"));
        dusts.add(new Dust("2020-03-30 18:00", "202", "4"));
        dusts.add(new Dust("2020-03-30 17:00", "112", "3"));
        dusts.add(new Dust("2020-03-30 16:00", "99", "3"));
        dusts.add(new Dust("2020-03-30 15:00", "56", "2"));
        dusts.add(new Dust("2020-03-30 14:00", "35", "2"));
        dusts.add(new Dust("2020-03-30 13:00", "75", "3"));
        dusts.add(new Dust("2020-03-30 12:00", "84", "3"));
        dusts.add(new Dust("2020-03-30 11:00", "97", "3"));
        dusts.add(new Dust("2020-03-30 10:00", "140", "4"));
        dusts.add(new Dust("2020-03-30 09:00", "81", "3"));
        dusts.add(new Dust("2020-03-30 08:00", "62", "2"));
        dusts.add(new Dust("2020-03-30 07:00", "44", "2"));
        dusts.add(new Dust("2020-03-30 06:00", "35", "2"));
        dusts.add(new Dust("2020-03-30 05:00", "11", "1"));
        dusts.add(new Dust("2020-03-30 04:00", "4", "1"));
        dusts.add(new Dust("2020-03-30 03:00", "18", "1"));
        dusts.add(new Dust("2020-03-30 02:00", "35", "2"));
        dusts.add(new Dust("2020-03-30 01:00", "47", "2"));

        return new LocationDust(location, dusts);
    }

}
