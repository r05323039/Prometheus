package observable.main.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("/api")
public class MainController {

    private static final List<byte[]> MEMORY_HOG = new ArrayList<>();
    private final RestTemplate restTemplate = new RestTemplate();
    private final Random random = new Random();
    @Value("${downstream.base-url}")
    private String downstreamBaseUrl;

    // baseline
    @GetMapping("/normal")
    public String normal() throws InterruptedException {
        Thread.sleep(20 + random.nextInt(30));
        return "OK";
    }

    // JVM 壓力
    @GetMapping("/memory")
    public String memory() {
        MEMORY_HOG.add(new byte[5 * 1024 * 1024]); // 5MB
        return "MEMORY_ALLOCATED";
    }

    // 下游延遲
    @GetMapping("/downstream")
    public String downstream(@RequestParam(defaultValue = "100") int delay) {
        String url = String.format("%s/delay?ms=%d",downstreamBaseUrl,delay);
        return restTemplate.getForObject(url, String.class);
    }
}
