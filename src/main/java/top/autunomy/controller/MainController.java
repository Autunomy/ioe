package top.autunomy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//总的Controller
@Controller
@RequestMapping("/")
public class MainController {

    //跳转到网站首页
    @RequestMapping({"/","/main"})
    public String toMain(){
        return "ioe/ioe_main";
    }
}
