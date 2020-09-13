package service;

import com.github.pagehelper.PageInfo;
import pojo.hirePerson;

import java.util.List;

public interface hirePersonService {
    void AddHirePerson (hirePerson rp);

    //hirePerson  CRUD  U
    void UpdateHirePerson (hirePerson rp);

    //hirePerson  CRUD  D   通过userId删除指定hirePerson
    void DeleteHirePersonById(Integer uid);

    //hirePerson  CRUD  R   通过userId查询指定hirePerson
    hirePerson GetHirePersonById(Integer uid);

    //hirePerson  CRUD  R   通过userName查询hirePerson
    List<hirePerson > GetHirePersonByName(String uname);

    //hirePerson  CRUD  R   查询所有hirePerson
    List<hirePerson > GetHirePersonList();

    //hirePerson  CRUD  R     分页查询 所有hirePerson
    PageInfo GetHirePersonListLimit(Integer startIndex, Integer pageSize);

    //hirePerson  CRUD  R     分页查询 所有uname为指定值的hirePerson
    PageInfo GetHirePersonByNameListLimit(String uname,Integer startIndex, Integer pageSize);
}
