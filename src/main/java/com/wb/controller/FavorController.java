package com.wb.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wb.controller.pojo.R;
import com.wb.domain.Car;
import com.wb.domain.Photo;
import com.wb.domain.User;
import com.wb.service.CarService;
import com.wb.service.FavorService;
import com.wb.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/favor")
public class FavorController {
    @Autowired
    private CarService carService;
    @Autowired
    private FavorService favorService;
    @Autowired
    private PhotoService photoService;

    @RequestMapping("/addFavor")
    public R addFavor(int carid, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");
        if(user!=null){
            int userid = user.getId();
            List<Integer> carids = favorService.selectIdsByUserId(user.getId());
            boolean flag = true;
            for (int i = 0; i < carids.size(); i++) {
                if(carid==carids.get(i)){
                    flag = false;
                }
            }
            if(flag){
                favorService.addFavor(userid, carid);
                //添加成功
                //反馈添加成功信息
                return new R(true,null,"添加收藏成功");
            }else {
                return new R(false,null,"已收藏该车辆");
            }
        }else {
            //还未登录，请登录后在收藏车辆
            return new R(false,null,"您还未登录，请进入登陆界面进行登录");
        }


    }

    @RequestMapping("/removeCarFavor")
    public R removeCarFavor(Integer carid, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        boolean b = favorService.removeCarFavor(user.getId(), carid);
        if(b){
            //删除成功反馈信息
            return new R(true,null,"删除单个成功");
        }else {
            //删除失败的原因
            return new R(false,null,"删除单个失败");
        }
    }

    @RequestMapping("/removeCarFavorByIds")
    public R removeCarFavorByIds(@RequestBody List<Integer> list,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        int[] carids = new int[list.size()];
        for (int i = 0; i < carids.length; i++) {
            carids[i] = list.get(i);
        }
        boolean b = favorService.removeCarFavorByIds(user.getId(),carids);
        if(b){
            //删除成功反馈信息
            return new R(true,null,"批量删除成功");
        }else {
            //删除失败的原因
            return new R(true,null,"批量删除失败");
        }
    }

    @RequestMapping("/selectIdsByUserId")
    public R selectIdsByUserId(@RequestBody Map map, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int current = (int) map.get("current");
        int size = (int) map.get("size");
        String search = (String) map.get("search");
        User user = (User) request.getSession().getAttribute("user");
        if(user!=null){
            List<Integer> carids = favorService.selectIdsByUserId(user.getId());
            if(carids.size()==0){
                return new R(false,null,"你还没收藏任何车辆哦！");
            }
            LambdaQueryWrapper<Car> wrapper = new LambdaQueryWrapper();
            wrapper.in(Car::getId,carids).
                    and(search!=null&&!"".equals(search),
                            wq->wq.like(Car::getDescription,search).or().
                                    like(Car::getModels,search).or().
                                    like(Car::getCarname,search));
            Page carPage = carService.page(new Page(current,size), wrapper);
            if(current > carPage.getPages()){
                carPage = carService.page(new Page(carPage.getPages(), size),wrapper);
            }
            //拿到收藏夹数据然后展示
            List<Photo> photodata = photoService.list();//找图片
            List<Car> tableData = carPage.getRecords();
            List<String> carurl =new ArrayList();

            for (int i = 0; i < tableData.size(); i++) {
                int id = tableData.get(i).getId();
                for (int j = 0; j < photodata.size(); j++) {
                    if(id==photodata.get(j).getCarid()){
                        carurl.add(photodata.get(j).getOverall());
                        break;
                    }
                }
            }

            R r1 = new R(carPage != null, carPage, null);
            R r2 = new R(carurl!=null, carurl, null);
            List<R> list = new ArrayList();
            list.add(r1);
            list.add(r2);

            return new R(list!=null,list,null);
        }else {
            //还没登录应该先登录才能查看收藏夹
            return new R(false,null,"还没登录");
        }

    }
}
