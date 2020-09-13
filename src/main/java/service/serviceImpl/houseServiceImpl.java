package service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.houseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.house;
import pojo.rentInfo;
import service.houseService;

import java.util.List;
@Service
public class houseServiceImpl implements houseService {

    @Autowired
    houseDao houseDao;

    @Override
    public void AddHouse(house ri) {
        houseDao.AddHouse(ri);
    }

    @Override
    public void UpdateHouse(house ri) {
        houseDao.UpdateHouse(ri);
    }

    @Override
    public void DeleteHouseById(Integer rid) {
        houseDao.DeleteHouseById(rid);
    }

    @Override
    public house GetHouseById(Integer rid) {
        return houseDao.GetHouseById(rid);
    }

    @Override
    public List<house> GetHouseList() {
        return houseDao.GetHouseList();
    }

    @Override
    public PageInfo GetHouseListLimit(Integer startIndex, Integer pageSize) {
        PageHelper.startPage(startIndex,pageSize);
        List<house> list = houseDao.GetHouseList();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
