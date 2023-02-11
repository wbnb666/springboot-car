package com.wb.dao;


import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface FavorDao{

    @Insert("insert into tb_favor values (#{userid}, #{carid})")
    boolean addFavor(@Param("userid") int userid, @Param("carid") int carid);

    @Delete("delete from tb_favor where userid = #{userid} and carid = #{carid}")
    boolean removeCarFavor(@Param("userid") int userid, @Param("carid") int carid);

    boolean removeCarFavorByIds(@Param("userid") int userid, @Param("carids") int[] carids);

    @Select("select carid from tb_favor where userid = #{userid}")
    List<Integer> selectIdsByUserId(@Param("userid") int userid);

    @Select("SELECT COUNT(carid) collection,carid from tb_favor GROUP BY carid ORDER BY collection desc limit 3  -- 查找前三车的收藏量")
    List<Map> selectTop3_Collection();

    @Select("SELECT COUNT(carid) collection,carid from tb_favor where carid= #{carid}  -- 查找某辆车的收藏量")
    Map<String,Integer> selectCollectionByCarid(@Param("carid") int carid);
}
