package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.UserAddDAO;
import ua.lv.entity.UserAdd;
import ua.lv.service.UserAddService;

import java.util.List;

/**
 * Created by User on 21.04.2019.
 */
@Service
@Transactional
public class UserAddServiceImpl implements UserAddService {
    @Autowired
    UserAddDAO userAddDAO;

    @Override
    public void addUserSave(UserAdd userAdd) {
        userAddDAO.save(userAdd);
    }

    @Override
    public void deleteUserAdd(int id) {
        userAddDAO.delete(id);
    }

    @Override
    public List<UserAdd> findAll() {
        return userAddDAO.findAll();
    }

    @Override
    public UserAdd findOne(int id) {
        return userAddDAO.findOne(id);
    }
}
