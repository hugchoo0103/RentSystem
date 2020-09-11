package service;

import com.github.pagehelper.PageInfo;
import pojo.house;

import java.util.List;

public interface houseService {
    //house  CRUD  C
    void AddHouse (house ri);

    //house  CRUD  U
    void UpdateHouse (house ri);

    //house  CRUD  D   通过houseId删除指定house
    void DeleteHouseById(Integer rid);

    //house  CRUD  R   通过houseId查询指定house
    house GetHouseById(Integer rid);

    //house  CRUD  R   查询所有house
    List<house> GetHouseList();

    //house  CRUD  R     分页查询 所有house
    PageInfo GetHouseListLimit(Integer startIndex, Integer pageSize);
}
