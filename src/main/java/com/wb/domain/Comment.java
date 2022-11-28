package com.wb.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@TableName("tb_comment")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private String createdate;
    private double score;
    private String photo1;
    private String photo2;
    private String photo3;
    private String username;
    private int userid;
    private int carid;

    public Comment(String conent, String createdate, double score, String username,int userid, int carid) {
        this.content = conent;
        this.createdate = createdate;
        this.score = score;
        this.username = username;
        this.userid = userid;
        this.carid = carid;
    }

    public Comment(String photo1, String photo2, String photo3) {
        this.photo1 = photo1;
        this.photo2 = photo2;
        this.photo3 = photo3;
    }
}
