package controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.hirePerson;
import pojo.rentInfo;
import pojo.rentPerson;
import service.hirePersonService;
import service.houseService;
import service.rentInfoService;
import service.rentPersonService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/rentInfo")
public class rentInfoController {
    @Autowired
    private rentInfoService riservice;
    @Autowired
    private hirePersonService hpservice;
    @Autowired
    private rentPersonService rpservice;
    @Autowired
    private houseService hsservice;


    //rentInfo query all
    @RequestMapping("/allRentInfo")
    public String getAllRentInfo(Model model) {
        List<rentInfo> rentInfoList = riservice.GetRentInfoList();
        model.addAttribute("rentInfoList", rentInfoList);
        return "rentInfo/allRentInfo";
    }


    //rentInfo query all   limit
    @RequestMapping("/allRentInfoLimit")
    public String getRentInfoListLimit(@RequestParam(required = false, defaultValue = "0", value = "startIndex") Integer startIndex,
                                       @RequestParam(required = false, defaultValue = "10", value = "pageSize") Integer pageSize, Model model) {
        PageInfo pageInfo = riservice.GetRentInfoListLimit(startIndex, pageSize);
        model.addAttribute("rentInfoList", pageInfo.getList());
        model.addAttribute("pageinfo", pageInfo);
        return "rentInfo/allRentInfo";
    }


    //rentInfo ++
    @RequestMapping("/toAddRentInfo")
    public String toAddRentInfo() {
        return "rentInfo/addRentInfo";
    }

    @RequestMapping("/addRentInfo")
    public String addRentInfo(rentInfo ri, Model model){
        if (riservice.GetRentInfoById(ri.getRentInfoId()) != null) {
            model.addAttribute("rentInfoerror", "rentInfo已存在");
            return "rentInfo/addRentInfo";
        }
        Date d1=ri.getRentStartDate();
        Date d2=ri.getRentEndDate();
        float rent = hsservice.GetHouseById(ri.getHouseId()).getRentPrice();
        ri.setPayMoney((float) (Math.ceil((double)(d2.getTime() - d1.getTime())/1000/60/60/24)*rent));

        ri.setRentTime((int) Math.ceil((double)(d2.getTime() - d1.getTime())/1000/60/60/24));

        hirePerson hp = hpservice.GetHirePersonById(ri.getHireId());
        rentPerson rp = rpservice.GetRentPersonById(ri.getRentId());
        ri.setHireName(hp.getUserName());
        ri.setHirePhone(hp.getPhone());
        ri.setRentName(rp.getUserName());
        ri.setRentPhone(rp.getPhone());

        riservice.AddRentInfo(ri);
        return "redirect:/rentInfo/allRentInfoLimit?startIndex=1";
    }


    //rentInfo modify
    @RequestMapping("/toUpdateRentInfo/{rentInfoId}")
    public String toUpdateRentInfo(@PathVariable("rentInfoId") Integer rid, Model model) {
        rentInfo ri = riservice.GetRentInfoById(rid);
        model.addAttribute("upRentInfo", ri);
        return "rentInfo/updateRentInfo";
    }

    @RequestMapping("/updateRentInfo")
    public String updateRentInfo(rentInfo ri){
        Date d1=ri.getRentStartDate();
        Date d2=ri.getRentEndDate();
        float rent = hsservice.GetHouseById(ri.getHouseId()).getRentPrice();
        ri.setPayMoney((float) (Math.ceil((double)(d2.getTime() - d1.getTime())/1000/60/60/24)*rent));

        ri.setRentTime((int) Math.ceil((double)(d2.getTime() - d1.getTime())/1000/60/60/24));

        hirePerson hp = hpservice.GetHirePersonById(ri.getHireId());
        rentPerson rp = rpservice.GetRentPersonById(ri.getRentId());
        ri.setHireName(hp.getUserName());
        ri.setHirePhone(hp.getPhone());
        ri.setRentName(rp.getUserName());
        ri.setRentPhone(rp.getPhone());

        riservice.UpdateRentInfo(ri);
        return "redirect:/rentInfo/allRentInfoLimit?startIndex=1";
    }


    //rentInfo --
    @RequestMapping("/deleteRentInfo/{rentInfoId}")
    public String deleteRentInfo(@PathVariable("rentInfoId") Integer rid, Model model) {
        riservice.DeleteRentInfoById(rid);
        return "redirect:/rentInfo/allRentInfoLimit?startIndex=1";
    }


    //rentInfo query rentInfoId
    @RequestMapping("/getRentInfoById")
    public String getRentInfoById(Integer rentInfoId, Model model) {
        rentInfo rp = riservice.GetRentInfoById(rentInfoId);
        List<rentInfo> list = new ArrayList<rentInfo>();
        list.add(rp);
        if (rp == null) {
            list = riservice.GetRentInfoList();
            model.addAttribute("error", "无搜索结果");
            return "forward:/rentInfo/allRentInfoLimit?startIndex=1";
        }
        model.addAttribute("rentInfoList", list);
        return "rentInfo/allRentInfo";
    }


}
