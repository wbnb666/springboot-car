package com.wb.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.Comment;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface CommentService extends IService<Comment> {
}
