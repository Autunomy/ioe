package top.autunomy.service;

import top.autunomy.pojo.Manager;

import java.util.List;

public interface ManagerService {
    //根据username和password查询管理员
    Manager queryManagerByUsernameAndPassword(String username,String password);

    //根据id判断某个管理员是否是超级管理员
    int judgeManagerIsRootById(String id);

    //根据id查找管理员
    Manager queryManagerById(String id);

    //查询所有的管理员
    List<Manager> queryAllManager();

    //添加一个普通管理员
    int insertCommonManager(Manager manager);

    //添加一个超级管理员
    int insertRootManager(Manager manager);

    //删除一个管理员
    int deleteManager(String id);

    //修改管理员的密码
    int updateManagerPassword(Manager manager);

    //将普通管理员提升为超级管理员
    int updateCommonManagerToRootManager(Manager manager);
}
