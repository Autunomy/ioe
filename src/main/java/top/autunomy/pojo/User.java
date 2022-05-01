package top.autunomy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class User {
    private String user_id;
    private String user_name;//学生姓名
    private String user_card;//学生卡号
    private String user_address;
    private String user_phone;
}
