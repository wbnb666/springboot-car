package com.wb.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface CommentService extends IService<Comment> {

    //取出前三评分的车辆信息照片在主页展示
    List<Map> selectTop3_AvgScore();

    //根据某辆车id找改车的平均评分
    Map selectAvgScoreByCarId(int carid);
}
