package com.wb.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@TableName("tb_user")
@NoArgsConstructor
public class User {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private Integer type;
    private String sex;
    private String phone;
    private String hobby;
    private String name;

    public User(String username, String password,Integer type) {
        this.username = username;
        this.password = password;
        this.type = type;
    }
}
