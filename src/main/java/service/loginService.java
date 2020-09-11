package service;

import pojo.login;

public interface loginService {
    login getUserByName(String userName,String password);
}
