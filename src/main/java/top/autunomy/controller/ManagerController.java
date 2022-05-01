package top.autunomy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import top.autunomy.pojo.Ioe;
import top.autunomy.pojo.Manager;
import top.autunomy.pojo.User;
import top.autunomy.service.IOEService;
import top.autunomy.service.ManagerService;
import top.autunomy.service.UserService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

//后台controller
@Controller
@RequestMapping("/manage")
public class ManagerController {

    @Autowired
    private IOEService ioeService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private UserService userService;

    //跳转到管理员登陆页面
    @RequestMapping(value = "/toManagerLogin")
    public String toManagerLogin(HttpSession session){
        //首先判断管理员是否已经登陆过了，如果已经登陆过那么直接跳转到对应的后台页面
        Manager OldManager = (Manager)session.getAttribute("manager");
        if(OldManager != null){
            if(OldManager.getIs_root() == 0){
                //普通管理员
                return "redirect:/manage/common_manager/common_manager_main.jsp";
            }else{
                //超级管理员
                return "redirect:/manage/root_manager/root_manager_main.jsp";
            }
        }

        //没有登陆那么就跳转到登陆页面
        return "manage/manager_login";
    }

    //判断登陆是否成功并分别进行跳转
    @RequestMapping(value = "/managerJudge")
    public String managerJudge(String username, String password, Model model, HttpSession session){
        if(username == null || password == null || "".equals(username) || "".equals(password)){
            model.addAttribute("msg","登陆信息有误");
            return "redirect:/manage/manager_login.jsp";
        }
        Manager manager = managerService.queryManagerByUsernameAndPassword(username, password);
        if(manager == null){
            model.addAttribute("msg","账号或者密码错误，请重新登陆");
            return "manage/manager_login";
        }

        session.setAttribute("manager",manager);
        if(manager.getIs_root() == 0){
            //普通管理员
            return "redirect:/manage/common_manager/common_manager_main.jsp";
        }else{
            //超级管理员
            return "redirect:/manage/root_manager/root_manager_main.jsp";
        }
    }

    //显示代取快递订单信息(不显示已取快递)
    @RequestMapping(value = "/showIOEMessage")
    public String admin(Model model){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        List<Ioe> result = ioeService.queryAllMessage();
        model.addAttribute("sf",sf);

        List<Ioe> ioes = new ArrayList<>();
        for (Ioe ioe : result) {
            if(ioe.getStatus().equals("未取")){
                ioes.add(ioe);
            }
        }

        model.addAttribute("ioes",ioes);
        return "manage/all_manager/ioe_message";
    }

    //显示所有代取快递订单信息(显示已取快递)
    @RequestMapping(value = "/showAllOrder")
    public String showAllOrder(Model model){
        List<Ioe> ioes = ioeService.queryAllMessage();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("sf",sf);
        model.addAttribute("ioes",ioes);
        return "manage/all_manager/ioe_message";
    }

    //查询当日未取订单
    @RequestMapping("/showTodayOrder")
    public String showTodayOrder(Model model){
        List<Ioe> result = ioeService.queryAllMessage();
        List<Ioe> ioes = new ArrayList<>();

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String today = sf.format(date);

        for (Ioe ioe : result) {
            //如果时间相等的话(只判断年月日)
            if(ioe.getStatus().equals("未取") && today.equals(sf.format(ioe.getDate()))){
                ioes.add(ioe);
            }
        }

        model.addAttribute("ioes",ioes);
        return "manage/all_manager/ioe_message";
    }

    //按照学号或者名称搜索快递信息
    @RequestMapping("/searchOrderByCardOrName")
    public String searchOrderByCardOrName(String search,Model model){
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
        return "manage/all_manager/ioe_message";
    }

    //修改当前代取快递状态(完成订单)
    @RequestMapping(value = "/changeStatus")
    public String changeStatus(String id,Model model){
        Ioe ioe = ioeService.queryByID(id);

        List<Ioe> ioes = ioeService.queryAllMessage();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");


        if(ioe.getStatus().equals("已取")){
            model.addAttribute("msg","快件已经被取了");
            //为了页面中仍然可以调用到所有订单信息，需要再次添加订单信息
            model.addAttribute("sf",sf);
            model.addAttribute("ioes",ioes);
            return "manage/all_manager/ioe_message";
        }
        ioe.setStatus("已取");
        int i = ioeService.updateStatus(ioe);
        //添加提示信息
        model.addAttribute("msg","已完成订单"+ioe.getId());
        //为了页面中仍然可以调用到所有订单信息，需要再次添加订单信息
        model.addAttribute("sf",sf);
        model.addAttribute("ioes",ioes);
        return "manage/all_manager/ioe_message";
    }

    //删除当前代取快递订单
    @RequestMapping(value = "/deleteOrder")
    public String deleteOrder(String id,Model model){
        int i = ioeService.deleteByID(id);
        model.addAttribute("msg","已删除订单"+id);
        return "manage/all_manager/ioe_message";
    }

    //注销登陆
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.setAttribute("manager",null);
        session.removeAttribute("manager");
        return "redirect:/";
    }

    //显示所有用户信息
    @RequestMapping("/showUserMessage")
    public String showUserMessage(Model model){
        List<User> users = userService.queryAllUser();
        model.addAttribute("users",users);
        return "manage/all_manager/user_message";
    }

    //删除用户
    @RequestMapping("/deleteUser")
    public String deleteUser(String user_id,Model model){
        int i = userService.deleteUser(user_id);
//        if(i == 1){
//            model.addAttribute("msg","删除成功");
//        }else{
//            model.addAttribute("msg","删除失败");
//        }
        return "redirect:/manage/showUserMessage";
    }

    //修改普通管理员的密码
    @RequestMapping("/updateCommonManagerPassword")
    public String updateCommonManagerPassword(String oldPassword,String newPassword,String confirmPassword,HttpSession session,Model model){
        if(!newPassword.equals(confirmPassword)){
            model.addAttribute("msg","两次密码不一致");
            return "manage/common_manager/change_password";
        }

        Manager manager = (Manager) session.getAttribute("manager");

        if(!oldPassword.equals(manager.getPassword())){
            model.addAttribute("msg","旧密码不正确");
            return "manage/common_manager/change_password";
        }

        manager.setPassword(newPassword);
        int i = managerService.updateManagerPassword(manager);
        if(i == 1){
            model.addAttribute("msg","密码修改成功");
            return "manage/common_manager/common_manager_main";
        }else{
            model.addAttribute("msg","密码修改失败");
            return "manage/common_manager/change_password";
        }
    }

    //管理所有普通管理员
    @RequestMapping("/showAllCommonManager")
    public String showAllCommonManager(Model model){
        List<Manager> managers = managerService.queryAllManager();
        model.addAttribute("managers",managers);
        return "manage/root_manager/mange_common_manager";
    }

    //删除一个管理员
    @RequestMapping("/deleteCommonManager")
    public String deleteCommonManager(String id,Model model){
        Manager manager = managerService.queryManagerById(id);
        if(manager.getIs_root() == 1){
            model.addAttribute("msg","超级管理员不能删除");
        }else{
            int i = managerService.deleteManager(id);
            if(i == 1){
                model.addAttribute("msg","删除成功");
            }else{
                model.addAttribute("msg","删除失败");
            }
        }

        List<Manager> managers = managerService.queryAllManager();
        model.addAttribute("managers",managers);
        return "manage/root_manager/mange_common_manager";
    }

    //添加一个普通管理员
    @RequestMapping("/addCommonManager")
    public String addCommonManager(String username,String password,Model model){
        Manager manager = new Manager(UUID.randomUUID().toString(),username,password,0);
        int i = managerService.insertCommonManager(manager);
        if(i == 1){
            model.addAttribute("msg","管理员创建成功");
        }else{
            model.addAttribute("msg","管理员创建失败");
        }
        return "manage/root_manager/add_common_manager";
    }
}
