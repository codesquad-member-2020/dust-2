package dust2.backend.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dust2.backend.domain.Coordinate;
import dust2.backend.domain.Station;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

@Service
public class StationLookUpService {

    private static final String stationUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/MsrstnInfoInqireSvc/getNearbyMsrstnList";
    private static final String openKey = "Z8qwWDMswr6XVaJnLJxFUo8YUGO6V3mbtq0jStPYjcMYGydRc9Uy%2Bfzyc%2BJhLod8oHgx3w8yWgPT8zdOK7LmOg%3D%3D";

    private final RestTemplate restTemplate;

    public StationLookUpService(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public Station getStation(Coordinate coordinate) throws JsonProcessingException {
        StringBuilder builder = new StringBuilder(stationUrl);
        builder.append("?ServiceKey=" + openKey)
                .append("&tmX=" + coordinate.getX())
                .append("&tmY=" + coordinate.getY())
                .append("&_returnType=" + "json");

        URI uri = URI.create(builder.toString());
        String rawStation = restTemplate.getForObject(uri, String.class);

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(rawStation);
        JsonNode rawStations = rootNode.path("list");
        return objectMapper.treeToValue(rawStations, Station[].class)[0];
    }
}
