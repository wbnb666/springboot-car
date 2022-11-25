package com.wb.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@TableName("tb_car")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String carname;
    private String models;
    private String description;
    private Double price;
}
