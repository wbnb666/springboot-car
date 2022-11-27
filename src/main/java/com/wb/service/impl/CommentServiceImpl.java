package com.wb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wb.dao.CommentDao;
import com.wb.domain.Comment;
import com.wb.service.CommentService;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends ServiceImpl<CommentDao, Comment> implements CommentService {
}
