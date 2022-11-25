package com.wb.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wb.domain.Car;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarDao extends BaseMapper<Car> {
}
