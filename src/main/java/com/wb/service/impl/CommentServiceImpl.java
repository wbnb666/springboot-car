package com.wb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wb.dao.CommentDao;
import com.wb.domain.Comment;
import com.wb.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl extends ServiceImpl<CommentDao, Comment> implements CommentService {

    @Autowired
    private CommentDao commentDao;

    //取出前三评分的车辆信息照片在主页展示
    @Override
    public List<Map> selectTop3_AvgScore() {
        List<Map> list = commentDao.selectAvgScore();
        return list;
    }

    //根据某辆车id找改车的平均评分
    @Override
    public Map selectAvgScoreByCarId(int carid) {
        Map map = commentDao.selectAvgScoreByCarId(carid);
        return map;
    }
}
