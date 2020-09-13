package dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pojo.rentInfo;
import pojo.rentPerson;

import java.util.List;

@Repository
public interface rentInfoDao {
    //rentInfo  CRUD  C
    void AddRentInfo (rentInfo ri);

    //rentInfo  CRUD  U
    void UpdateRentInfo (rentInfo ri);

    //rentInfo  CRUD  D   通过rentInfoId删除指定rentInfo
    void DeleteRentInfoById(@Param("rentInfoId") Integer rid);

    //rentInfo  CRUD  R   通过rentInfoId查询指定rentInfo
    rentInfo GetRentInfoById(@Param("rentInfoId") Integer rid);

    //rentInfo  CRUD  R   查询所有rentInfo
    List<rentInfo> GetRentInfoList();
}
