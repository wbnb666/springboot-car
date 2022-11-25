package com.wb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wb.controller.pojo.R;
import com.wb.domain.Car;
import com.wb.domain.Photo;
import com.wb.service.CarService;
import com.wb.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/cars")
public class CarController {
    @Autowired
    private CarService carService;
    @Autowired
    private PhotoService photoService;

    @RequestMapping("/getOne")
    public R getAll(@RequestParam Integer id) throws ServletException, IOException {

        QueryWrapper<Car> carWrapper = new QueryWrapper();
        QueryWrapper<Photo> photoWrapper = new QueryWrapper();
        carWrapper.eq("id",id);
        photoWrapper.eq("carid",id);
        Car cardata = carService.getOne(carWrapper);
        Photo carphoto = photoService.getOne(photoWrapper);

        R r1 = new R(cardata != null, cardata, null);
        R r2 = new R(carphoto!=null, carphoto, null);
        List<R> list = new ArrayList();
        list.add(r1);
        list.add(r2);

        return new R(list!=null,list,null);


    }

    @RequestMapping("/getAll")
    public R getLike(@RequestBody Map map){
        Integer current = (Integer) map.get("current");
        Integer size = (Integer) map.get("size");
        String models = (String) map.get("models");
        String description = (String) map.get("description");
        String carname = (String) map.get("carname");

//        Page<Car> carPage = new Page(current,size);
        LambdaQueryWrapper<Car> wrapper = new LambdaQueryWrapper();
        wrapper.
                and(!"".equals(description)&&description!=null,wq->wq.like(Car::getDescription,description)).
                and(!"".equals(models)&&models!=null,wq -> wq.eq(Car::getModels,models)).
                and(!"".equals(carname)&&carname!=null,wq -> wq.like(Car::getCarname,carname));
        Page carPage = carService.page(new Page(current,size), wrapper);
        if(current > carPage.getPages()){
            carPage = carService.page(new Page(carPage.getPages(), size),wrapper);
        }

        //取出数据获得对应顺序的图片
        List<Photo> photodata = photoService.list();//找图片
        List<Car> tableData = carPage.getRecords();
        List<Photo> carurl =new ArrayList();

        for (int i = 0; i < tableData.size(); i++) {
            int id = tableData.get(i).getId();
            for (int j = 0; j < photodata.size(); j++) {
                if(id==photodata.get(j).getCarid()){
                    carurl.add(photodata.get(j));
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
    }

    @RequestMapping("/getSearch")
    public R getSearch(@RequestBody Map<String,String> map) {//从current开始找，每次只找5条数据
        int current = Integer.valueOf(map.get("current"));
        String search = map.get("search");
        String models = map.get("models");


        LambdaQueryWrapper<Car> wrapper = new LambdaQueryWrapper();
        wrapper.
                and(!"".equals(search)&&search!=null,wq->wq.like(Car::getDescription,search).
                    or().
                    like(Car::getCarname,search).
                    or().
                    like(Car::getModels,search)
                ).
                and(!"".equals(models)&&models!=null&&!"全部车型".equals(models),wq -> wq.like(Car::getModels,models));
        if(map.get("min")!=null&&!"".equals(map.get("min"))){
            int min = Integer.parseInt(map.get("min"));
            wrapper.ge(Car::getPrice, min);
        }
        if (map.get("max")!=null&&!"".equals(map.get("max"))){
            int max = Integer.parseInt(map.get("max"));
            wrapper.le(Car::getPrice, max);
        }

        Page carPage = carService.page(new Page(current,5), wrapper);
        if(current > carPage.getPages()){
            carPage = carService.page(new Page(carPage.getPages(), 5),wrapper);
        }

        //取出数据获得对应顺序的图片
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
    }


    @RequestMapping("/removeById")
    public R removeById(int id){
        LambdaQueryWrapper<Photo> wrapper = new LambdaQueryWrapper();
        wrapper.eq(Photo::getCarid,id);
        photoService.remove(wrapper);
        boolean b = carService.removeById(id);
        return new R(b,null,"删除成功");
    }

    @RequestMapping("/save")
    public R save(@RequestBody Map<String,String> map){
        String carname = map.get("carname");
        String description = map.get("description");
        double price = Double.parseDouble(map.get("price"));
        String models = map.get("models");
        Car car = new Car(null,carname,models,description,price);
        boolean save = carService.save(car);
        LambdaQueryWrapper<Car> wrapper = new LambdaQueryWrapper<>();
        wrapper.
                and(!"".equals(description)&&description!=null,wq->wq.like(Car::getDescription,description)).
                and(!"".equals(models)&&models!=null,wq -> wq.like(Car::getModels,models)).
                and(!"".equals(carname)&&carname!=null,wq -> wq.like(Car::getCarname,carname));
        Car car1 = carService.getOne(wrapper);
        photoService.save(new Photo(null,null,null,null,car1.getId()));
        return new R(save, null, "添加成功");
    }

    @RequestMapping("/updateById")
    public R updateById(@RequestBody Map<String,String> map){
        int id = Integer.parseInt(map.get("id"));
        String carname = map.get("carname");
        String models = map.get("models");
        String description = map.get("description");
        double price = Double.parseDouble(map.get("price"));
        Car car = new Car(id,carname,models,description,price);
        boolean b = carService.updateById(car);
        return new R(b,null,"修改成功");
    }

    @RequestMapping("/removeByIds")
    public R deleteByIds(@RequestBody List<Integer> list) {
        LambdaQueryWrapper<Photo> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(list!=null,Photo::getCarid,list);
        boolean b1 = photoService.remove(wrapper);
        boolean b = carService.removeByIds(list);
        return new R(b,null,"批量删除成功");
    }

    @RequestMapping("/getPriceArea")
    public R getPriceArea(Double max,Double min){
        QueryWrapper<Car> wrapper = new QueryWrapper<>();
        wrapper.lt(max!=null,"price",max);
        wrapper.gt(min!=null,"price",min);
        List<Car> list = carService.list(wrapper);
        return new R(true,list,null);
    }
}




