package com.wb;

import com.wb.dao.CarDao;
import com.wb.domain.Car;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(properties = {"server.port=8080"})
class SpringbootCarApplicationTests {

    @Autowired
    private CarDao carDao;
    @Value("${server.port}")
    private String pro;
    @Test
    void contextLoads() {
        Car car = new Car();
        car.setCarname("asdasd");
        car.setModels("SUV");
        car.setDescription("asdasfsafadsgdsdfhd");
        car.setPrice(4654.454);
        carDao.insert(car);
    }

    @Test
    void test(){
        System.out.println(this.pro);
    }

}
