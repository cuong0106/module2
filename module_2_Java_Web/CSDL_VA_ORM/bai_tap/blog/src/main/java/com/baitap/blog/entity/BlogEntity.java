package com.baitap.blog.model;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
public class Blog {
    @Id
    @GeneratedValue
    private long id;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Date dateCreated;

    private String content;

    private String title;

    public Date getDateCreated()
    {
        return this.dateCreated;
    }

    public void setDateCreated(String dateCreated) throws ParseException
    {
        DateFormat dateFormat=
                new SimpleDateFormat("yyyy-MM-dd'T'hh:mm"); //định dạng trả về theo năm, tháng, ngày, tab , giờ, phút
        Date date=(Date)dateFormat.parse(dateCreated); //chuyển chuổi trong biến dateCreated thành kiểu Date theo định dạng trong SimpleDateFormat
        this.dateCreated=date;
    }

    public long getId() {
        return id;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
