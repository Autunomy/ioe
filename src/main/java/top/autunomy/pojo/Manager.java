package top.autunomy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class Manager {
    private String id;
    private String username;
    private String password;
    private Integer is_root;//判断是否是超级管理员 0表示普通管理员  1表示超级管理员

    @Override
    public String toString() {
        return "Manager{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", is_root=" + is_root +
                '}';
    }
}
