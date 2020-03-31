package dust2.backend.web;

import dust2.backend.BackendApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mockup")
public class MockupController {

    private static Logger logger = LoggerFactory.getLogger(BackendApplication.class);

    @Value("${openapi.secret_key}")
    private String apiKey;

    @GetMapping
    public void sample() {

    }
}
