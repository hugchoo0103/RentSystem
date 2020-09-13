package controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.house;
import service.houseService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/house")
public class houseController {
    @Autowired
    houseService houseService;

    //house query all
    @RequestMapping("/allHouse")
    public String getAllHouse(Model model){
        List<house> houseList = houseService.GetHouseList();
        model.addAttribute("houseList",houseList);
        return "house/allHouse";
    }


    //house query all   limit
    @RequestMapping("/allHouseLimit")
    public String getHouseListLimit(@RequestParam(required = false,defaultValue = "0",value = "startIndex") Integer startIndex,
                                       @RequestParam(required = false,defaultValue = "10",value = "pageSize")Integer pageSize,Model model){
        PageInfo pageInfo = houseService.GetHouseListLimit(startIndex,pageSize);
        model.addAttribute("houseList",pageInfo.getList());
        model.addAttribute("pageinfo",pageInfo);
        return "house/allHouse";
    }
    
    //house ++
    @RequestMapping("/toAddHouse")
    public String toAddHouse(){
        return "house/addHouse";
    }

    @RequestMapping("/addHouse")
    public String addHouse(house house,Model model){
        if(houseService.GetHouseById(house.getHouseId())!=null){
            model.addAttribute("houseerror","house已存在");
            return "house/addHouse";
        }
        houseService.AddHouse(house);
        return "redirect:/house/allHouseLimit?startIndex=1";
    }


    //house modify
    @RequestMapping("/toUpdateHouse/{houseId}")
    public String toUpdateHouse(@PathVariable("houseId") Integer houseId, Model model){
        house house = houseService.GetHouseById(houseId);
        model.addAttribute("upHouse",house);
        return "house/updateHouse";
    }

    @RequestMapping("/updateHouse")
    public String updateHouse(house house){
        houseService.UpdateHouse(house);
        return "redirect:/house/allHouseLimit?startIndex=1";
    }


    //house --
    @RequestMapping("/deleteHouse/{houseId}")
    public String deleteHouse(@PathVariable("houseId") Integer houseId, Model model){
        houseService.DeleteHouseById(houseId);
        return "redirect:/house/allHouseLimit?startIndex=1";
    }


    //house query houseId
    @RequestMapping("/getHouseById")
    public String getHouseById(Integer houseId, Model model){
        house house = houseService.GetHouseById(houseId);
        List<house> list = new ArrayList<house>();
        list.add(house);
        if(house==null){
            list = houseService.GetHouseList();
            model.addAttribute("error","无搜索结果");
            return "forward:/house/allHouseLimit?startIndex=1";
        }
        model.addAttribute("houseList",list);
        return "house/allHouse";
    }
    
}
