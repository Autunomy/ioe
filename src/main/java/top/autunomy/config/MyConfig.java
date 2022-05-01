package top.autunomy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyConfig implements WebMvcConfigurer {
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        //注册TestInterceptor拦截器
//        InterceptorRegistration registration = registry.addInterceptor(new ManagerLoginInterceptor());
//        registration.addPathPatterns("/**")//拦截所有请求
//                .excludePathPatterns(
//                        "/",
//                        "/main",
//                        "/ioe/**"
//                );//不拦截这些请求
//    }

    //将自定义Interceptor添加进IOC容器，不添加没法再其属性类使用依赖注入，注入其他对象实例
//    @Bean
//    public ManagerLoginInterceptor appTokenInterceptor() {
//        return new ManagerLoginInterceptor();
//    }
}
