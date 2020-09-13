package dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pojo.house;

import java.util.List;


@Repository
public interface houseDao {
    @Insert("insert into house(houseType,houseStatus,rentPrice,houseRemark) values(#{houseType},#{houseStatus},#{rentPrice},#{houseRemark})")
    void AddHouse (house ri);

    //house  CRUD  U
    @Update("update house set houseType=#{houseType},houseStatus=#{houseStatus},rentPrice=#{rentPrice},houseRemark=#{houseRemark} where houseId=#{houseId}")
    void UpdateHouse (house ri);

    //house  CRUD  D   通过houseId删除指定house
    @Delete("delete from house where houseId=#{houseId} ")
    void DeleteHouseById(@Param("houseId") Integer rid);

    //house  CRUD  R   通过houseId查询指定house
    @Select("select * from house where houseId=#{houseId}")
    house GetHouseById(@Param("houseId") Integer rid);

    //house  CRUD  R   查询所有house
    @Select("select * from house")
    List<house> GetHouseList();
}
