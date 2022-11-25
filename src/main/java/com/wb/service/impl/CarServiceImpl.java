package com.wb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wb.dao.CarDao;
import com.wb.domain.Car;
import com.wb.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl extends ServiceImpl<CarDao, Car> implements CarService {
}
