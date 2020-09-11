package controller;


import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.hirePerson;
import service.hirePersonService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/hirePerson")
public class hirePersonController {

    @Autowired
    hirePersonService hirePersonService;
    //hirePerson query all
    @RequestMapping("/allHirePerson")
    public String getAllHirePerson(Model model){
        List<hirePerson> hirePersonList = hirePersonService.GetHirePersonList();
        model.addAttribute("hirePersonList",hirePersonList);
        return "hirePerson/allHirePerson";
    }


    //hirePerson query all   limit
    @RequestMapping("/allHirePersonLimit")
    public String getHirePersonListLimit(@RequestParam(required = false,defaultValue = "0",value = "startIndex") Integer startIndex,
                                         @RequestParam(required = false,defaultValue = "10",value = "pageSize")Integer pageSize,Model model){
        PageInfo pageInfo = hirePersonService.GetHirePersonListLimit(startIndex,pageSize);
        model.addAttribute("hirePersonList",pageInfo.getList());
        model.addAttribute("pageinfo",pageInfo);
        return "hirePerson/allHirePerson";
    }

    //hirePerson ++
    @RequestMapping("/toAddHirePerson")
    public String toAddHirePerson(){
        return "hirePerson/addHirePerson";
    }

    @RequestMapping("/addHirePerson")
    public String addHirePerson(hirePerson hire,Model model){
        if(hirePersonService.GetHirePersonById(hire.getHireId())!=null){
            model.addAttribute("hirePersonerror","hirePerson已存在");
            return "hirePerson/addHirePerson";
        }
        hirePersonService.AddHirePerson(hire);
        return "redirect:/hirePerson/allHirePersonLimit?startIndex=1";
    }


    //hirePerson modify
    @RequestMapping("/toUpdateHirePerson/{userID}")
    public String toUpdateHirePerson(@PathVariable("userID") Integer uid, Model model){
        hirePerson hire = hirePersonService.GetHirePersonById(uid);
        model.addAttribute("upHirePerson",hire);
        return "hirePerson/updateHirePerson";
    }

    @RequestMapping("/updateHirePerson")
    public String updateHirePerson(hirePerson hire){
        hirePersonService.UpdateHirePerson(hire);
        return "redirect:/hirePerson/allHirePersonLimit?startIndex=1";
    }


    //hirePerson --
    @RequestMapping("/deleteHirePerson/{uid}")
    public String deleteHirePerson(@PathVariable("uid") Integer uid,Model model){
        hirePersonService.DeleteHirePersonById(uid);
        return "redirect:/hirePerson/allHirePersonLimit?startIndex=1";
    }


    //hirePerson query userID
    @RequestMapping("/getHirePersonByID")
    public String getHirePersonByID(Integer uid, Model model){
        hirePerson hire = hirePersonService.GetHirePersonById(uid);
        List<hirePerson> list = new ArrayList<hirePerson>();
        list.add(hire);
        if(hire==null){
            list = hirePersonService.GetHirePersonList();
            model.addAttribute("error","无搜索结果");
            return "forward:/hirePerson/allHirePersonLimit?startIndex=1";
        }
        model.addAttribute("hirePersonList",list);
        return "hirePerson/allHirePerson";
    }

    //hirePerson query userName   limit
    @RequestMapping("/getHirePersonByNameLimit")
    public String getHirePersonByNameLimit(String uname, Integer startIndex, Integer pageSize, Model model){
        PageInfo pageInfo = hirePersonService.GetHirePersonByNameListLimit(uname,startIndex,pageSize);
        if(pageInfo.getTotal()==0){
            List<hirePerson> list = hirePersonService.GetHirePersonList();
            pageInfo = new PageInfo(list);
            model.addAttribute("error","无搜索结果");
        }
        model.addAttribute("HirePersonList",pageInfo.getList());
        model.addAttribute("pageinfo",pageInfo);
        return "hirePerson/allHirePerson";
    }
}
