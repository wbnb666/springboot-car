package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao extends BaseMapper<User>{
}
