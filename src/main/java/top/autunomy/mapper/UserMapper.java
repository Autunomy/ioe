package top.autunomy.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.autunomy.pojo.User;

import java.util.List;

@Mapper
public interface UserMapper {
    //查询所有的用户信息
    List<User> queryAllUser();

    //根据用户id查询用户
    User queryUserById(String user_id);

    //根据用户名查询用户
    User queryUserByUserName(String user_name);

    //根据学号查询用户
    User queryUserByUserCard(String user_card);

    //添加一个用户
    int insertUser(User user);

    //修改用户信息
    int updateUser(User user);

    //根据删除一个用户
    int deleteUser(String user_id);
}
