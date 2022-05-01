package top.autunomy.filter;

import top.autunomy.pojo.Manager;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "MyWebFilter",urlPatterns = "/manage/*")
public class MyWebFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession();
        Manager manager = (Manager) session.getAttribute("manager");

        //获取请求的ip和端口
        String requestURI = req.getRequestURI();
        String s = req.getRequestURL().toString();
        //URL的格式为   http://localhost
        String URL = s.replaceAll(requestURI,"");

        //若未登录
        if(manager == null){
            //但是要访问的是登陆页面就放行
            if(requestURI.equals("/manage/toManagerLogin") ||
                    requestURI.equals("/manage/manager_login.jsp") ||
                    requestURI.equals("/manage/managerJudge")){
                filterChain.doFilter(req,resp);
                return;
            }else{
                //访问的不是登陆页就跳转到登录页
                resp.sendRedirect(URL+"/manage/toManagerLogin");
            }
        }else{
            //已经登陆过了就直接放行
            filterChain.doFilter(req,resp);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
