package controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.rentPerson;
import service.rentPersonService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rentPerson")
public class rentPersonController {
    @Autowired
    private rentPersonService rpservice;

    //rentPerson query all
    @RequestMapping("/allRentPerson")
    public String getAllRentPerson(Model model){
        List<rentPerson> rentPersonList = rpservice.GetRentPersonList();
        model.addAttribute("rentPersonList",rentPersonList);
        return "rentPerson/allRentPerson";
    }


    //rentPerson query all   limit
    @RequestMapping("/allRentPersonLimit")
    public String getRentPersonListLimit(@RequestParam(required = false,defaultValue = "0",value = "startIndex") Integer startIndex,
                                        @RequestParam(required = false,defaultValue = "10",value = "pageSize")Integer pageSize,Model model){
        PageInfo pageInfo = rpservice.GetRentPersonListLimit(startIndex,pageSize);
        model.addAttribute("rentPersonList",pageInfo.getList());
        model.addAttribute("pageinfo",pageInfo);
        return "rentPerson/allRentPerson";
    }



    //rentPerson ++
    @RequestMapping("/toAddRentPerson")
    public String toAddRentPerson(){
        return "rentPerson/addRentPerson";
    }

    @RequestMapping("/addRentPerson")
    public String addRentPerson(rentPerson rp,Model model){
        if(rpservice.GetRentPersonById(rp.getUserId())!=null){
            model.addAttribute("rentPersonerror","rentPerson已存在");
            return "rentPerson/addRentPerson";
        }
        rpservice.AddRentPerson(rp);
        return "redirect:/rentPerson/allRentPersonLimit?startIndex=1";
    }


    //rentPerson modify
    @RequestMapping("/toUpdateRentPerson/{userId}")
    public String toUpdateRentPerson(@PathVariable("userId") Integer uid, Model model){
        rentPerson rp = rpservice.GetRentPersonById(uid);
        model.addAttribute("upRentPerson",rp);
        return "rentPerson/updateRentPerson";
    }

    @RequestMapping("/updateRentPerson")
    public String updateRentPerson(rentPerson rp){
        rpservice.UpdateRentPerson(rp);
        return "redirect:/rentPerson/allRentPersonLimit?startIndex=1";
    }


    //rentPerson --
    @RequestMapping("/deleteRentPerson/{uid}")
    public String deleteRentPerson(@PathVariable("uid") Integer uid,Model model){
        rpservice.DeleteRentPersonById(uid);
        return "redirect:/rentPerson/allRentPersonLimit?startIndex=1";
    }


    //rentPerson query userId
    @RequestMapping("/getRentPersonById")
    public String getRentPersonById(Integer uid,Model model){
        rentPerson rp = rpservice.GetRentPersonById(uid);
        List<rentPerson> list = new ArrayList<rentPerson>();
        list.add(rp);
        if(rp==null){
            list = rpservice.GetRentPersonList();
            model.addAttribute("error","无搜索结果");
            return "forward:/rentPerson/allRentPersonLimit?startIndex=1";
        }
        model.addAttribute("rentPersonList",list);
        return "rentPerson/allRentPerson";
    }

    //rentPerson query userName   limit
    @RequestMapping("/getRentPersonByNameLimit")
    public String getRentPersonByNameLimit(String uname, Integer startIndex, Integer pageSize, Model model){
        PageInfo pageInfo = rpservice.GetRentPersonByNameListLimit(uname,startIndex,pageSize);
        if(pageInfo.getTotal()==0){
            List<rentPerson> list = rpservice.GetRentPersonList();
            pageInfo = new PageInfo(list);
            model.addAttribute("error","无搜索结果");
        }
        model.addAttribute("RentPersonList",pageInfo.getList());
        model.addAttribute("pageinfo",pageInfo);
        return "rentPerson/allRentPerson";
    }


}
