package top.autunomy.config;

import org.springframework.web.servlet.HandlerInterceptor;
import top.autunomy.pojo.Manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ManagerLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            //统一拦截（查询当前session是否存在user）(这里user会在每次登陆成功后，写入session)
            Manager manager = (Manager) request.getSession().getAttribute("manager");
            if(manager != null){
                System.out.println(manager);
                return true;
            }
            request.setAttribute("msg","请先登陆");
            request.getRequestDispatcher("/toAdminLogin").forward(request,response);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;//如果设置为false时，被请求时，拦截器执行到此处将不会继续操作
        //如果设置为true时，请求将会继续执行后面的操作
    }
}
