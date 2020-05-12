package com.baitap.blog.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Blog {
    @Override
    private com.baitap.blog.repository.Blog blog;

    @GetMapping("/blog-sort")
    public ModelAndView sort(Pageable pageable){
        return new ModelAndView(
                "/blog/blog","blogs",
                blog.findAllThenOrderByDateCreated(pageable)
        );
    }
}
