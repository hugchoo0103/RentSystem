package dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pojo.rentPerson;

import java.util.List;

@Repository
public interface rentPersonDao {
    //rentPerson  CRUD  C
    void AddRentPerson (rentPerson rp);

    //rentPerson  CRUD  U
    void UpdateRentPerson (rentPerson rp);

    //rentPerson  CRUD  D   通过userId删除指定rentPerson
    void DeleteRentPersonById(@Param("userId") Integer uid);

    //rentPerson  CRUD  R   通过userId查询指定rentPerson
    rentPerson GetRentPersonById(@Param("userId") Integer uid);

    //rentPerson  CRUD  R   通过userName查询rentPerson
    List<rentPerson > GetRentPersonByName(@Param("userName") String uname);

    //rentPerson  CRUD  R   查询所有rentPerson
    List<rentPerson > GetRentPersonList();
}
