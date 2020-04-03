package dust2.backend.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dust2.backend.domain.Forecast;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

public class ForecastApiUtils {
    private static final Logger log = LoggerFactory.getLogger(ForecastApiUtils.class);
    private static String today = DateUtils.getToday();

    public static Forecast getTodayForecastFromOpenApi() throws URISyntaxException, JsonProcessingException {
        String apiURL =
                "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMinuDustFrcstDspth?searchDate=";
        String serviceKey = "&ServiceKey=ck2PICliE4pVzLMDrn6ujDZn76komYPNmfjWX2yzK3%2FJWAq5ktMEEhH3kqWKwL%2FellxN8aZYFGo3KAXnD6XdLw%3D%3D";
        String returnJson = "&_returnType=json";

        URI publicApiRequestUrl = new URI(apiURL + today + serviceKey + returnJson);
        log.info("publicApiRequestUrl : {}" , publicApiRequestUrl);

        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(publicApiRequestUrl, String.class);
        return jsonStringToObject(response);
    }

    private static Forecast jsonStringToObject(String response) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();

        JsonNode forecastArray = objectMapper.readTree(response).get("list");
        JsonNode todayForecastNode = forecastArray.get(0);

        List<String> forecastImages = getTodayImagesFromJson(forecastArray);
        return new Forecast(todayForecastNode, forecastImages);
    }

    private static List<String> getTodayImagesFromJson(JsonNode forecastArray) {
        List<String> images = new ArrayList<>();
        List<JsonNode> morningForecasts = new ArrayList<>();
        List<JsonNode> afternoonForecasts = new ArrayList<>();
        JsonNode imageObject;

        //오늘 날짜의 미세먼지 이미지만 가져옴
        for(int i=forecastArray.size()-1; i>=0; i--) {
            imageObject = forecastArray.get(i);

            if(!imageObject.get("informCode").asText().equals("PM10")){
                continue;
            }

            if(!today.equals(imageObject.get("informData").asText())){
                continue;
            }

            if(imageObject.get("dataTime").asText().contains("23시") || imageObject.get("dataTime").asText().contains("17시")) {
                afternoonForecasts.add(imageObject);
                continue;
            }

            morningForecasts.add(imageObject);

        }
        images = sortImagesInOrder(morningForecasts);
        images.addAll(sortImagesInOrder(afternoonForecasts));

        return images;
    }

    private static List<String> sortImagesInOrder(List<JsonNode> forecasts) {
        int imageCount = 3;
        List<String> images = new ArrayList<>();

        for (int i=0; i<imageCount; i++) {
            for(int j=0; j<forecasts.size(); j++) {
                images.add(forecasts.get(j).get("imageUrl"+(i+1)).asText());
            }
        }

        return images;
    }
}
