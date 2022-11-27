package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDao extends BaseMapper<Comment> {//BaseMapper已经包含了基础的常用的SQL语句
}
