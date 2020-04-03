package dust2.backend.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dust2.backend.domain.AirQualityInfo;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;

@Service
public class AirQualityLookUpService {

    private static final String airQualityUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty";
    private static final String openKey = "Z8qwWDMswr6XVaJnLJxFUo8YUGO6V3mbtq0jStPYjcMYGydRc9Uy%2Bfzyc%2BJhLod8oHgx3w8yWgPT8zdOK7LmOg%3D%3D";

    private RestTemplate restTemplate;

    public AirQualityLookUpService(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public AirQualityInfo[] getAirQuality(String stationName) throws JsonProcessingException, UnsupportedEncodingException {

        StringBuilder builder = new StringBuilder(airQualityUrl);
        builder.append("?ServiceKey=" + openKey)
                .append("&stationName=" + URLEncoder.encode(stationName, "UTF-8"))
                .append("&dataTerm=" + "DAILY")
                .append("&numOfRows=" + "24")
                .append("&_returnType=" + "json");
        URI uri = URI.create(builder.toString());
        String rawRealtimeDust = restTemplate.getForObject(uri, String.class);

        ObjectMapper mapper = new ObjectMapper();

        JsonNode rootNode = mapper.readTree(rawRealtimeDust);
        JsonNode dustsNode = rootNode.path("list");
        return mapper.treeToValue(dustsNode, AirQualityInfo[].class);
    }
}
