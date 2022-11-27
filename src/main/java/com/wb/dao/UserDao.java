package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao extends BaseMapper<User>{//BaseMapper已经包含了基础的常用的SQL语句
}
