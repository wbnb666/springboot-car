package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.Photo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PhotoDao extends BaseMapper<Photo> {

    @Select("select * from tb_photo where carid = #{carid}")
    Photo getOneById(Integer carid);
}
