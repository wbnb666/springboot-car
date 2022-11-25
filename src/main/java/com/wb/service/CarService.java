package com.wb.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.Car;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface CarService extends IService<Car> {
}
