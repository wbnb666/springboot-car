package com.wb.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wb.dao.FavorDao;
import com.wb.service.FavorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FavorServiceImpl implements FavorService {

    @Autowired
    private FavorDao favorDao;

    @Override
    public boolean addFavor(int userid, int carid) {
        return favorDao.addFavor(userid, carid);

    }

    @Override
    public boolean removeCarFavor(int userid, int carid) {
        return favorDao.removeCarFavor(userid,carid);
    }

    @Override
    public List<Integer> selectIdsByUserId(int userid) {
        return favorDao.selectIdsByUserId(userid);
    }

    @Override
    public boolean removeCarFavorByIds(int userid, int[] carids) {
        return favorDao.removeCarFavorByIds(userid,carids);

    }

    @Override
    public List<Map> selectTop3_Collection() {
        List<Map> maps = favorDao.selectTop3_Collection();
        return maps;
    }

    @Override
    public Map selectCollectionByCarid(int carid) {
        Map map = favorDao.selectCollectionByCarid(carid);
        return map;
    }
}
