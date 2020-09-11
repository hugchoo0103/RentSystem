package controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.rentInfo;
import pojo.rentPerson;
import service.rentInfoService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rentInfo")
public class rentInfoController {
    @Autowired
    private rentInfoService riservice;


    //rentInfo query all
    @RequestMapping("/allRentInfo")
    public String getAllRentInfo(Model model){
        List<rentInfo> rentInfoList = riservice.GetRentInfoList();
        model.addAttribute("rentInfoList",rentInfoList);
        return "rentInfo/allRentInfo";
    }


    //rentInfo query all   limit
    @RequestMapping("/allRentInfoLimit")
    public String getRentInfoListLimit(@RequestParam(required = false,defaultValue = "0",value = "startIndex") Integer startIndex,
                                         @RequestParam(required = false,defaultValue = "10",value = "pageSize")Integer pageSize,Model model){
        PageInfo pageInfo = riservice.GetRentInfoListLimit(startIndex,pageSize);
        model.addAttribute("rentInfoList",pageInfo.getList());
        model.addAttribute("pageinfo",pageInfo);
        return "rentInfo/allRentInfo";
    }



    //rentInfo ++
    @RequestMapping("/toAddRentInfo")
    public String toAddRentInfo(){
        return "rentInfo/addRentInfo";
    }

    @RequestMapping("/addRentInfo")
    public String addRentInfo(rentInfo ri,Model model){
        if(riservice.GetRentInfoById(ri.getRentInfoID())!=null){
            model.addAttribute("rentInfoerror","rentInfo已存在");
            return "rentInfo/addRentInfo";
        }
        riservice.AddRentInfo(ri);
        return "redirect:/rentInfo/allRentInfoLimit?startIndex=1";
    }


    //rentInfo modify
    @RequestMapping("/toUpdateRentInfo/{rentInfoID}")
    public String toUpdateRentInfo(@PathVariable("rentInfoID") Integer rid, Model model){
        rentInfo ri = riservice.GetRentInfoById(rid);
        model.addAttribute("upRentInfo",ri);
        return "rentInfo/updateRentInfo";
    }

    @RequestMapping("/updateRentInfo")
    public String updateRentInfo(rentInfo ri){
        riservice.UpdateRentInfo(ri);
        return "redirect:/rentInfo/allRentInfoLimit?startIndex=1";
    }


    //rentInfo --
    @RequestMapping("/deleteRentInfo/{rid}")
    public String deleteRentInfo(@PathVariable("rid") Integer rid,Model model){
        riservice.DeleteRentInfoById(rid);
        return "redirect:/rentInfo/allRentInfoLimit?startIndex=1";
    }


    //rentInfo query rentInfoID
    @RequestMapping("/getRentInfoByID")
    public String getRentInfoByID(Integer rid, Model model){
        rentInfo rp = riservice.GetRentInfoById(rid);
        List<rentInfo> list = new ArrayList<rentInfo>();
        list.add(rp);
        if(rp==null){
            list = riservice.GetRentPersonList();
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
