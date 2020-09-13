package service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.rentInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.rentInfo;
import pojo.rentPerson;
import service.rentInfoService;

import java.util.List;

@Service
public class rentInfoServiceImpl implements rentInfoService {
    @Autowired
    private rentInfoDao ridao;

    @Override
    public void AddRentInfo(rentInfo ri) {
        ridao.AddRentInfo(ri);
    }

    @Override
    public void UpdateRentInfo(rentInfo ri) {
        ridao.UpdateRentInfo(ri);
    }

    @Override
    public void DeleteRentInfoById(Integer rid) {
        ridao.DeleteRentInfoById(rid);
    }

    @Override
    public rentInfo GetRentInfoById(Integer rid) {

        return ridao.GetRentInfoById(rid);
    }

    @Override
    public List<rentInfo> GetRentInfoList() {
        return ridao.GetRentInfoList();
    }

    @Override
    public PageInfo GetRentInfoListLimit(Integer startIndex, Integer pageSize) {
        PageHelper.startPage(startIndex,pageSize);
        List<rentInfo> list = ridao.GetRentInfoList();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
