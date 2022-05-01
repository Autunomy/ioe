package top.autunomy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.autunomy.mapper.ManagerMapper;
import top.autunomy.pojo.Manager;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public Manager queryManagerByUsernameAndPassword(String username, String password) {
        return managerMapper.queryManagerByUsernameAndPassword(username,password);
    }

    @Override
    public int judgeManagerIsRootById(String id) {
        return managerMapper.judgeManagerIsRootById(id);
    }

    @Override
    public Manager queryManagerById(String id) {
        return managerMapper.queryManagerById(id);
    }

    @Override
    public List<Manager> queryAllManager() {
        return managerMapper.queryAllManager();
    }

    @Override
    public int insertCommonManager(Manager manager) {
        manager.setIs_root(0);
        return managerMapper.insertCommonManager(manager);
    }

    @Override
    public int insertRootManager(Manager manager) {
        manager.setIs_root(1);
        return managerMapper.insertRootManager(manager);
    }

    @Override
    public int deleteManager(String id) {
        return managerMapper.deleteManager(id);
    }

    @Override
    public int updateManagerPassword(Manager manager) {
        return managerMapper.updateManagerPassword(manager);
    }

    @Override
    public int updateCommonManagerToRootManager(Manager manager) {
        manager.setIs_root(1);
        return managerMapper.updateCommonManagerToRootManager(manager);
    }
}
