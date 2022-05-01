package top.autunomy.service;

import top.autunomy.pojo.Ioe;

import java.util.List;

public interface IOEService {
    //查询所有的代取快递信息
    public List<Ioe> queryAllMessage();

    //根据id查询订单
    public Ioe queryByID(String id);

    //查询个人所有订单
    List<Ioe> queryByUserCard(String user_card);

    //新增代取快递信息
    public int insertMessage(Ioe ioe);

    //修改当前快递状态
    public int updateStatus(Ioe ioe);

    //修改订单信息
    int updateOrder(Ioe ioe);

    //修改快递的存放地址
    int updateExpressDeliveryId(Ioe ioe);

    //根据id删除订单
    public int deleteByID(String id);
}
