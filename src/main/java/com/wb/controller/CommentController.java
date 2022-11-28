package com.wb.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wb.domain.Comment;
import com.wb.domain.Photo;
import com.wb.domain.User;
import com.wb.service.CommentService;
import com.wb.service.PhotoService;
import com.wb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private PhotoService photoService;

    @RequestMapping("/getCommentsByCarId")
    public List getCommentsByCarId(@RequestBody Map<String,String> map, HttpSession session){
        String carid = map.get("carid");//只招某一辆车的
        String description = map.get("description");//根据评论描述找
        int type = Integer.parseInt(map.get("type"));//根据某种类型排序
        int current = Integer.parseInt(map.get("current"));//页码
        int size = Integer.parseInt(map.get("size"));//最大页数
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Comment::getCarid,carid)
                .and(description!=null&&!"".equals(description),wq->wq.like(Comment::getContent,description))
                .orderByDesc(type==1,Comment::getCreatedate)//最新排序
                .orderByAsc(type==2,Comment::getCreatedate)//最晚排序
                .orderByAsc(type==3,Comment::getScore)//按评分升序
                .orderByDesc(type==4,Comment::getScore);//按评分降序
        Page page = commentService.page(new Page(current,size), wrapper);
        if(current > page.getPages()){
            page = commentService.page(new Page(page.getPages(), size),wrapper);
        }
        List<Comment> commentList = page.getRecords();
        User user = (User) session.getAttribute("user");
        if(user!=null){
            for (int i = 0; i < commentList.size(); i++) {
                if(commentList.get(i).getUsername().equals(user.getName())){

                }
            }
        }
        return commentList;
    }

    @RequestMapping("/createComment")
    public boolean createComment(HttpServletRequest request, MultipartFile[] files) throws IOException {
        String content = request.getParameter("content");//根据评论描述找
        double score = Double.parseDouble(request.getParameter("score"));
        User user = (User) request.getSession().getAttribute("user");
        if(user==null){
            System.out.println("该用户还未登录！不能进行评论！");
            return false;
        }
        int userName = user.getId();
        int carid = Integer.parseInt(request.getParameter("carid"));//只招某一辆车的

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(date);

        Comment comment = new Comment(content,format,score,user.getName(),user.getId(),carid);
        if(files.length!=0){
            for (int i = 0; i < files.length; i++) {
                String url = "D:/Big_HomeWork/springboot-car/src/main/webapp/comment_img/user"+userName+"car"+carid+"("+i+1+"+).png";
                byte[] bytes = files[i].getBytes();
                BufferedOutputStream bfo = new BufferedOutputStream(new FileOutputStream(url));
                bfo.write(bytes);
                if(i==files.length){
                    bfo.close();
                }
            }
            comment.setPhoto1("../comment_img/user"+userName+"car"+carid+"(1).png");
            comment.setPhoto2("../comment_img/user"+userName+"car"+carid+"(2).png");
            comment.setPhoto3("../comment_img/user"+userName+"car"+carid+"(3).png");
        }
        boolean save = commentService.save(comment);

        return save;
    }

    @RequestMapping("getTop3_Score")
    public List getTop3_Score(){
        List<Map> top3AvgScore = commentService.selectTop3_AvgScore();
        List<Integer> carids = new ArrayList<>();
        for (int i = 0; i < top3AvgScore.size(); i++) {
            Map<Integer, Integer> map = top3AvgScore.get(i);
            Integer carid = map.get("carid");
            carids.add(carid);
        }
        LambdaQueryWrapper<Photo> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(Photo::getCarid,carids);
        List<Photo> photos = photoService.list(wrapper);
        List result = new ArrayList<>();
        result.add(top3AvgScore);
        result.add(photos);
        return result;
    }

    @RequestMapping("getAvgScoreByCarid")
    public Map getAvgScoreByCarid(int carid){
        Map map = commentService.selectAvgScoreByCarId(carid);
        return map;
    }

}
