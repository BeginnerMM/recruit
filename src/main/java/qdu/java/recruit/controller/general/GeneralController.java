package qdu.java.recruit.controller.general;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@EnableAutoConfiguration
public class GeneralController {

    /**
     * 注册
     *
     * @return
     */
    @GetMapping(value = "/register")
    public String userRegister() {
        return "general/register";
    }

}
