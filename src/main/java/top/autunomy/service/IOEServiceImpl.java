package top.autunomy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.autunomy.mapper.IOEMapper;
import top.autunomy.pojo.Ioe;

import java.util.List;

@Service
public class IOEServiceImpl implements IOEService {

    @Autowired
    private IOEMapper ioeMapper;

    @Override
    public List<Ioe> queryAllMessage() {
        return ioeMapper.queryAllMessage();
    }

    @Override
    public Ioe queryByID(String id) {
        return ioeMapper.queryByID(id);
    }

    @Override
    public List<Ioe> queryByUserCard(String user_card) {
        return ioeMapper.queryByUserCard(user_card);
    }

    @Override
    public int insertMessage(Ioe ioe) {
        return ioeMapper.insertMessage(ioe);
    }

    @Override
    public int updateStatus(Ioe ioe) {
        return ioeMapper.updateStatus(ioe);
    }

    @Override
    public int updateOrder(Ioe ioe) {
        return ioeMapper.updateOrder(ioe);
    }

    @Override
    public int updateExpressDeliveryId(Ioe ioe) {
        return ioeMapper.updateExpressDeliveryId(ioe);
    }

    @Override
    public int deleteByID(String id) {
        return ioeMapper.deleteByID(id);
    }
}
