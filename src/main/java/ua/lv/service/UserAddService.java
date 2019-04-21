package ua.lv.service;

import ua.lv.entity.UserAdd;

import java.util.List;

/**
 * Created by User on 21.04.2019.
 */
public interface UserAddService {
    void addUserSave(UserAdd userAdd);
    void deleteUserAdd(int id);
    List<UserAdd> findAll();
    UserAdd findOne(int id);
}
