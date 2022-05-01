package top.autunomy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.autunomy.mapper.UserMapper;
import top.autunomy.pojo.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public User queryUserById(String user_id) {
        return userMapper.queryUserById(user_id);
    }

    @Override
    public User queryUserByUserName(String user_name) {
        return userMapper.queryUserByUserName(user_name);
    }

    @Override
    public User queryUserByUserCard(String user_card) {
        return userMapper.queryUserByUserCard(user_card);
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUser(String user_id) {
        return userMapper.deleteUser(user_id);
    }
}
