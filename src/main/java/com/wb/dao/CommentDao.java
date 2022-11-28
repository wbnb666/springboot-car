package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommentDao extends BaseMapper<Comment> {//BaseMapper已经包含了基础的常用的SQL语句


    //取出前三评分的车辆信息照片在主页展示
    @Select("SELECT ROUND(avg(score),1) carscore,carid from tb_comment GROUP BY carid ORDER BY carscore desc limit 3")
    List<Map> selectAvgScore();

    //根据某辆车id找改车的平均评分
    @Select("SELECT ROUND(avg(score),1) carscore,carid from tb_comment WHERE carid = #{carid}")
    Map selectAvgScoreByCarId(@Param("carid") int carid);


}
