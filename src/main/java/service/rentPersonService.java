package service;

import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import pojo.rentPerson;

import java.util.List;

public interface rentPersonService {

    //rentPerson  CRUD  C
    void AddRentPerson (rentPerson rp);

    //rentPerson  CRUD  U
    void UpdateRentPerson (rentPerson rp);

    //rentPerson  CRUD  D   通过userId删除指定rentPerson
    void DeleteRentPersonById(Integer uid);

    //rentPerson  CRUD  R   通过userId查询指定rentPerson
    rentPerson GetRentPersonById(Integer uid);

    //rentPerson  CRUD  R   通过userName查询rentPerson
    List<rentPerson > GetRentPersonByName(String uname);

    //rentPerson  CRUD  R   查询所有rentPerson
    List<rentPerson > GetRentPersonList();

    //rentPerson  CRUD  R     分页查询 所有rentPerson
    PageInfo GetRentPersonListLimit(Integer startIndex, Integer pageSize);

    //rentPerson  CRUD  R     分页查询 所有uname为指定值的rentPerson
    PageInfo GetRentPersonByNameListLimit(String uname,Integer startIndex, Integer pageSize);
}
