package dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pojo.hirePerson;


import java.util.List;

@Repository
public interface hirePersonDao {

    @Insert("insert into hireperson(userName,sex,phone,email) values(#{userName},#{sex},#{phone},#{email})")
    void AddHirePerson (hirePerson rp);

    //hirePerson  CRUD  U
    @Update("update hireperson  set  userName=#{userName},sex=#{sex},phone=#{phone},email=#{email} where hireId=#{hireId}")
    void UpdateHirePerson (hirePerson rp);

    //hirePerson  CRUD  D   通过userId删除指定hirePerson
    @Delete("delete from hireperson where hireId=#{hireId}")
    void DeleteHirePersonById(@Param("hireId") Integer uid);

    //hirePerson  CRUD  R   通过userId查询指定hirePerson
    @Select("select * from hireperson where hireId=#{hireId}")
    hirePerson GetHirePersonById(@Param("hireId") Integer uid);

    //hirePerson  CRUD  R   通过userName查询hirePerson
    @Select("select * from hireperson where userName=#{userName}")
    List<hirePerson > GetHirePersonByName(@Param("userName") String uname);

    //hirePerson  CRUD  R   查询所有hirePerson
    @Select("select * from hireperson")
    List<hirePerson > GetHirePersonList();
}
