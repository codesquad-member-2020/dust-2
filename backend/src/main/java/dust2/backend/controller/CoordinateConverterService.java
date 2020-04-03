package dust2.backend.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dust2.backend.domain.Coordinate;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

@Service
public class CoordinateConverterService {
    private static final String kakaoUrl = "http://dapi.kakao.com/v2/local/geo/transcoord.json";
    private static final String kakaoKey = "40c7173253e2f27a66b263f70fe09f8b";

    private final RestTemplate restTemplate;

    public CoordinateConverterService(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public Coordinate getCoordinate(double latitude, double longitude) throws JsonProcessingException {
        String builder = kakaoUrl + "?x=" + longitude +
                "&y=" + latitude +
                "&output_coord=TM";
        URI uri = URI.create(builder);

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set(HttpHeaders.AUTHORIZATION, "KakaoAK " + kakaoKey);
        HttpEntity<?> httpEntity = new HttpEntity<>(httpHeaders);

        String result = restTemplate.exchange(uri, HttpMethod.GET, httpEntity, String.class).getBody();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(result);
        JsonNode rawCoordinates = rootNode.path("documents");
        return mapper.treeToValue(rawCoordinates, Coordinate[].class)[0];
    }
}
