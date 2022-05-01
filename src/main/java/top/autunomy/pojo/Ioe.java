package top.autunomy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class Ioe {
    private String id;
    private String user_card;//外键 和用户中的学生卡账号一样
    private String expressdeliveryid;//快递存放点
    private String status;//快递状态
    private Date date;//订单创建日期

    private User user;
}
