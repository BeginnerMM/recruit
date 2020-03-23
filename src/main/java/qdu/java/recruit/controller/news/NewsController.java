package qdu.java.recruit.controller.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import qdu.java.recruit.entity.NewsEntity;
import qdu.java.recruit.entity.UserEntity;
import qdu.java.recruit.pojo.NewsDetailBO;
import qdu.java.recruit.service.NewsDetailService;
import qdu.java.recruit.service.NewsService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsDetailService newsDetailService;

    /**
     * 资讯展示
     * @param httpSession
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/news/{page}")
    @ResponseBody
    public Map<String, Object> newsIndex(HttpSession httpSession,
                                         @PathVariable int page,
                                         @RequestParam(value = "limit", defaultValue = "6") int limit) {

        Map<String, Object> map = new HashMap<>();
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
        List<NewsEntity> list = newsService.list(page, limit);
        map.put("user",user);
        map.put("list",list);
        return map;
    }

    /**
     * 资讯详情
     * @param httpSession
     * @param id
     * @return
     */
    @PostMapping("/news/news_detail/{id}")
    @ResponseBody
    public Map<String,Object> newsDetail(HttpSession httpSession,
                                         @PathVariable int id){
        Map<String, Object> map = new HashMap<>();
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
        NewsDetailBO newsDetailBO  = newsDetailService.selectById(id);
        map.put("user",user);
        map.put("newsDetailBo",newsDetailBO);
        return map;
    }

    @PostMapping("/news/news_detail")
    @ResponseBody
    public Map<String,Object> newDetail(HttpSession httpSession,
                                        @RequestParam("keyword") String keyword){
        Map<String, Object> map = new HashMap<>();
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
        NewsDetailBO newsDetailBO  = newsDetailService.selectByTitle(keyword);
        map.put("user",user);
        map.put("newsDetailBo",newsDetailBO);
        return map;

    }

}
