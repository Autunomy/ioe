package top.autunomy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import top.autunomy.pojo.Ioe;
import top.autunomy.pojo.User;
import top.autunomy.service.IOEService;
import top.autunomy.service.UserService;

import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private IOEService ioeService;

    //用户注册
    @RequestMapping("/addUser")
    public String addUser(String user_name,String user_card,String user_address,String user_phone, Model model){
        //只需要按照学号来判断，因为有重名
        User user1 = userService.queryUserByUserCard(user_card);

        if(user1 != null){
            model.addAttribute("msg","用户已存在");
            return "ioe/ioe_main";
        }

        int i = userService.insertUser(new User(UUID.randomUUID().toString(),user_name,user_card,user_address,user_phone));
        if(i != 0){
            model.addAttribute("msg","注册成功");
        }else{
            model.addAttribute("msg","注册失败");
        }

        return "ioe/ioe_main";
    }

    //查找要修改的订单信息
    @RequestMapping("/findUpdateOrder")
    public String findUpdateOrder(String id,Model model){
        Ioe ioe = ioeService.queryByID(id);
        if(ioe == null){
            model.addAttribute("msg","未找到订单信息");
        }else{
            model.addAttribute("ioe",ioe);
        }
        return "user/change_order_message";
    }

    //修改订单信息
    @RequestMapping("/updateOrder")
    public String updateOrder(String id,String user_card,String expressdeliveryid,Model model){
        Ioe ioe = ioeService.queryByID(id);
        ioe.setUser_card(user_card);
        ioe.setExpressdeliveryid(expressdeliveryid);
        int i = ioeService.updateOrder(ioe);
        model.addAttribute("msg","修改成功");
        return "user/change_order_message";
    }

    //自动填写用户信息
    @RequestMapping("/findUpdateUser")
    public String updateUser(Model model,String user_card){
        User usercard = userService.queryUserByUserCard(user_card);
        if(usercard == null || usercard.equals("")){
            model.addAttribute("msg","未查询到用户信息");
        } else if(usercard != null || !usercard.equals("")){
            model.addAttribute("user",usercard);
        }
        return "user/change_user_message";
    }

    //修改用户信息
    @RequestMapping("/updateUser")
    public String updateUser(User user,Model model){
        int i = userService.updateUser(user);
        if(i == 1){
            model.addAttribute("msg","修改成功");
        }else{
            model.addAttribute("msg","修改失败");
        }
        return "ioe/ioe_main";
    }
}
