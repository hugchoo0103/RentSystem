package service;

import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import pojo.rentInfo;
import pojo.rentPerson;

import java.util.List;

public interface rentInfoService {

    //rentInfo  CRUD  C
    void AddRentInfo (rentInfo ri);

    //rentInfo  CRUD  U
    void UpdateRentInfo (rentInfo ri);

    //rentInfo  CRUD  D   通过rentInfoId删除指定rentInfo
    void DeleteRentInfoById(Integer rid);

    //rentInfo  CRUD  R   通过rentInfoId查询指定rentInfo
    rentInfo GetRentInfoById(Integer rid);

    //rentInfo  CRUD  R   查询所有rentInfo
    List<rentInfo> GetRentInfoList();

    //rentInfo  CRUD  R     分页查询 所有rentInfo
    PageInfo GetRentInfoListLimit(Integer startIndex, Integer pageSize);
}
