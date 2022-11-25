package com.wb.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.Photo;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface PhotoService extends IService<Photo> {

    Photo getOneById(Integer carid);
}
