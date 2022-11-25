package com.wb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wb.dao.PhotoDao;
import com.wb.domain.Photo;
import com.wb.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhotoServiceImpl extends ServiceImpl<PhotoDao, Photo> implements PhotoService {
    @Autowired
    private PhotoDao photoDao;
    @Override
    public Photo getOneById(Integer carid) {
        Photo photo = photoDao.getOneById(carid);
        return photo;
    }
}
