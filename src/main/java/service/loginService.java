package service;

import pojo.login;

public interface loginService {
    login getUserById(int loginId,String password);
}
