package top.autunomy.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import top.autunomy.pojo.Ioe;
import top.autunomy.pojo.User;
import top.autunomy.service.IOEService;
import top.autunomy.service.UserService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

//业务：代取快递
@Controller
@RequestMapping("/ioe")
public class IOEController {
    @Autowired
    private IOEService ioeService;

    @Autowired
    private UserService userService;

    //跳转到代取快递页面
    @RequestMapping(value = {"/","/main"})
    public String view(){
        return "ioe/ioe_main";
    }

    //添加订单
    @RequestMapping(value = "/addOrder")
    public String addOrder(String user_card, String address,String card, Model model){
        String expressdeliveryid = address + card;
        //先判断这个学号是否已经注册
        User user = userService.queryUserByUserCard(user_card);
        if(user == null){
            model.addAttribute("msg","用户不存在，请先注册");
            return "ioe/ioe_main";
        }

        Ioe ioe = new Ioe(UUID.randomUUID().toString(),user_card,expressdeliveryid,"未取",new Date(),userService.queryUserByUserCard(user_card));
        int i = ioeService.insertMessage(ioe);
        if(i != 0){
            model.addAttribute("msg","订单提交成功");
        }else{
            model.addAttribute("msg","订单提交失败");
        }
        return "ioe/ioe_main";
    }

    //根据姓名或者学号查询未取订单
    @RequestMapping("/queryOrders")
    public String queryOrders(String search,Model model){
        User userByName = userService.queryUserByUserName(search);
        User userByCard = userService.queryUserByUserCard(search);
        List<Ioe> result = new ArrayList<>();
        if(userByName != null){
            List<Ioe> ioes = ioeService.queryByUserCard(userByName.getUser_card());
            for (Ioe ioe : ioes) {
                if(ioe.getStatus().equals("未取")){
                    result.add(ioe);
                }
            }
            model.addAttribute("ioes",result);
        }else if(userByCard != null){
            List<Ioe> ioes = ioeService.queryByUserCard(userByCard.getUser_card());
            for (Ioe ioe : ioes) {
                if(ioe.getStatus().equals("未取")){
                    result.add(ioe);
                }
            }
            model.addAttribute("ioes",result);
        }else{
            model.addAttribute("msg","未查询到订单信息");
        }
        //用来进行日期时间格式化
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("sf",simpleDateFormat);
        return "ioe/query_orders";
    }

    //根据姓名或者学号查询历史订单
    @RequestMapping("/queryHistoryOrders")
    public String queryHistoryOrders(String search,Model model){
        User userByName = userService.queryUserByUserName(search);
        User userByCard = userService.queryUserByUserCard(search);
        if(userByName != null){
            List<Ioe> ioes = ioeService.queryByUserCard(userByName.getUser_card());
            model.addAttribute("ioes",ioes);
        }else if(userByCard != null){
            List<Ioe> ioes = ioeService.queryByUserCard(userByCard.getUser_card());
            model.addAttribute("ioes",ioes);
        }else{
            model.addAttribute("msg","未查询到订单信息");
        }

        //用来进行日期时间格式化
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("sf",simpleDateFormat);
        return "ioe/query_orders";
    }

    //帮朋友下单订单
    //user_address是宿舍地址 address是取件地址  card是取件码
//    @RequestMapping("/orderForFriend")
//    public String orderForFriend(String user_card,String user_name,String user_phone,String user_address,String address,String card,Model model){
//        Ioe ioe = new Ioe(UUID.randomUUID().toString(), user_card, address + card, "未取", new Date(), null);
//
//        System.out.println(ioe);
//
//        User user = new User();
//        user.setUser_id(UUID.randomUUID().toString());
//        user.setUser_name(user_name);
//        user.setUser_card(user_card);
//        user.setUser_phone(user_phone);
//        user.setUser_address(user_address);
//        ioe.setUser(user);
//        userService.insertUser(user);
//
//        int i = ioeService.insertMessage(ioe);
//        if(i == 1){
//            model.addAttribute("msg","订单添加成功");
//        }else{
//            model.addAttribute("msg","订单添加失败");
//        }
//        return "ioe/friend_order";
//    }
}
