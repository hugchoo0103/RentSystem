package service.serviceImpl;

import dao.loginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.login;
import service.loginService;
@Service
public class loginServiceImpl implements loginService {
    @Autowired
    loginDao loginDao;

    @Override
    public login getUserById(int loginId,String password) {
        return loginDao.getUserByName(loginId,password);
    }
}
