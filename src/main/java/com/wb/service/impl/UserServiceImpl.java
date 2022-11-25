package com.wb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wb.dao.UserDao;
import com.wb.domain.User;
import com.wb.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
}
