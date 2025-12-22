package observable.downstream.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DownstreamController {

    @GetMapping("/delay")
    public String delay(@RequestParam(defaultValue = "100") int ms) throws InterruptedException {
        Thread.sleep(ms);
        return "DELAY " + ms;
    }
}
