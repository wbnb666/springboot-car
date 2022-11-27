package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.Photo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PhotoDao extends BaseMapper<Photo> {//BaseMapper已经包含了基础的常用的SQL语句

    @Select("select * from tb_photo where carid = #{carid}")
    Photo getOneById(Integer carid);
}
