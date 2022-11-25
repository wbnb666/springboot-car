package com.wb.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.User;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserService extends IService<User> {
}
