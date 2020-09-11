package service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.rentPersonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.rentInfo;
import pojo.rentPerson;
import service.rentPersonService;

import java.util.List;

@Service
public class rentPersonServiceImpl implements rentPersonService {
    @Autowired
    private rentPersonDao rpdao;

    @Override
    public void AddRentPerson(rentPerson rp) {
        rpdao.AddRentPerson(rp);
    }

    @Override
    public void UpdateRentPerson(rentPerson rp) {
        rpdao.UpdateRentPerson(rp);
    }

    @Override
    public void DeleteRentPersonById(Integer uid) {
        rpdao.DeleteRentPersonById(uid);
    }

    @Override
    public rentPerson GetRentPersonById(Integer uid) {
        return rpdao.GetRentPersonById(uid);
    }

    @Override
    public List<rentPerson> GetRentPersonByName(String uname) {
        return rpdao.GetRentPersonByName(uname);
    }

    @Override
    public List<rentPerson> GetRentPersonList() {
        return rpdao.GetRentPersonList();
    }

    @Override
    public PageInfo GetRentPersonListLimit(Integer startIndex, Integer pageSize) {
        PageHelper.startPage(startIndex,pageSize);
        List<rentPerson> list = rpdao.GetRentPersonList();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public PageInfo GetRentPersonByNameListLimit(String uname, Integer startIndex, Integer pageSize) {
        PageHelper.startPage(startIndex,pageSize);
        List<rentPerson> list = rpdao.GetRentPersonByName(uname);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
