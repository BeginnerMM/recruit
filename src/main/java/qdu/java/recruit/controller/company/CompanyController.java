package qdu.java.recruit.controller.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import qdu.java.recruit.entity.CompanyDetailEntity;
import qdu.java.recruit.entity.UserEntity;
import qdu.java.recruit.pojo.CompanyDetailBO;
import qdu.java.recruit.service.CompanyDetailService;
import qdu.java.recruit.service.CompanyService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CompanyController {


    @Autowired
    private CompanyDetailService companyDetailService;

    @Autowired
    private CompanyService companyService;

    /**
     * 公司展示
     * @param httpSession
     * @param page
     * @param city
     * @param limit
     * @return
     */
    @GetMapping(value = "/companyPage/{page}")
    @ResponseBody
    public Map<String,Object> companyIndex(HttpSession httpSession,@PathVariable int page,
                                           @RequestParam(value = "city",defaultValue = "100000") int city,
                                           @RequestParam(value = "limit", defaultValue = "6") int limit){


        Map<String, Object> map = new HashMap<>();
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
        List<CompanyDetailEntity> list =  companyDetailService.list(page,limit,city);
        map.put("user",user);
        map.put("conpanyDetailList",list);
        return map;

    }

    /**
     * 公司详情
     * @param httpSession
     * @param id
     * @param page
     * @param status
     * @param limit
     * @return
     */
    @PostMapping("/company/company_detail/{id}")
    @ResponseBody
    public Map<String,Object> companyDetail(HttpSession httpSession, @PathVariable int id,
                                             int page,
                                            @RequestParam(value = "status",defaultValue = "1") int status,
                                            @RequestParam(value = "limit", defaultValue = "3") int limit){
        Map<String, Object> map = new HashMap<>();
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
        List<CompanyDetailBO> list = companyDetailService.listCompanyDetail(id,page,limit);
        map.put("user",user);
        map.put("list",list);
        map.put("status",status);
        return map;
    }

    @PostMapping("/company/company_detail")
    @ResponseBody
    public Map<String,Object> companyDetail(HttpSession httpSession,
                                            @RequestParam("keyword") String keyword,
                                            @RequestParam(value = "page",defaultValue = "1") int page,
                                            @RequestParam(value = "status",defaultValue = "1") int status,
                                            @RequestParam(value = "limit", defaultValue = "3") int limit){
        Map<String, Object> map = new HashMap<>();
        UserEntity user = (UserEntity) httpSession.getAttribute("user");
        List<CompanyDetailBO> list  = companyDetailService.listCompanyDetailByName(keyword,page,limit);
        map.put("user",user);
        map.put("list",list);
        map.put("status",status);
        return map;

    }


}
