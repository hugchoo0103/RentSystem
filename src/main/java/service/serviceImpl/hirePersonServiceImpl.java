package service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.hirePersonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.hirePerson;
import pojo.rentPerson;
import service.hirePersonService;

import java.util.List;


@Service
public class hirePersonServiceImpl implements hirePersonService {
    @Autowired
    hirePersonDao hirePersonDao;

    @Override
    public void AddHirePerson(hirePerson rp) {
        hirePersonDao.AddHirePerson(rp);
    }

    @Override
    public void UpdateHirePerson(hirePerson rp) {
        hirePersonDao.UpdateHirePerson(rp);
    }

    @Override
    public void DeleteHirePersonById(Integer uid) {
        hirePersonDao.DeleteHirePersonById(uid);
    }

    @Override
    public hirePerson GetHirePersonById(Integer uid) {
        return hirePersonDao.GetHirePersonById(uid);
    }

    @Override
    public List<hirePerson> GetHirePersonByName(String uname) {
        return hirePersonDao.GetHirePersonByName(uname);
    }

    @Override
    public List<hirePerson> GetHirePersonList() {
        return hirePersonDao.GetHirePersonList();
    }

    @Override
    public PageInfo GetHirePersonListLimit(Integer startIndex, Integer pageSize) {
        PageHelper.startPage(startIndex,pageSize);
        List<hirePerson> list = hirePersonDao.GetHirePersonList();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public PageInfo GetHirePersonByNameListLimit(String uname, Integer startIndex, Integer pageSize) {
        return null;
    }
}
