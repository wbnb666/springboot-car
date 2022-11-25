package com.wb.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FavorDao{

    @Insert("insert into tb_favor values (#{userid}, #{carid})")
    boolean addFavor(@Param("userid") int userid, @Param("carid") int carid);

    @Delete("delete from tb_favor where userid = #{userid} and carid = #{carid}")
    boolean removeCarFavor(@Param("userid") int userid, @Param("carid") int carid);

    boolean removeCarFavorByIds(@Param("userid") int userid, @Param("carids") int[] carids);

    @Select("select carid from tb_favor where userid = #{userid}")
    List<Integer> selectIdsByUserId(@Param("userid") int userid);

}
