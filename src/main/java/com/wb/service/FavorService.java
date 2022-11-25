package com.wb.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.Car;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface FavorService {

    boolean addFavor(int userid, int carid);

    boolean removeCarFavor(int userid, int carid);

    List<Integer> selectIdsByUserId(int userid);

    boolean removeCarFavorByIds(int userid, int[] carids);
}
