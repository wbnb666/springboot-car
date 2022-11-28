package com.wb.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.wb.domain.Car;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface FavorService {

    boolean addFavor(int userid, int carid);

    boolean removeCarFavor(int userid, int carid);

    List<Integer> selectIdsByUserId(int userid);

    boolean removeCarFavorByIds(int userid, int[] carids);

    List<Map> selectTop3_Collection();

    Map selectCollectionByCarid(int carid);
}
