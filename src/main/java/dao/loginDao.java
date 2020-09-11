package dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pojo.login;
@Repository
public interface loginDao {


    @Select("select * from login where userName=#{userName} and password=#{password}")
     login getUserByName(@Param("userName") String userName, @Param("password") String password);

}
