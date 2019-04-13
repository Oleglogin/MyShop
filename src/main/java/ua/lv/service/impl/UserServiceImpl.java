package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.UserDAO;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    UserDAO userDAO;

    public void save(User user) {
        userDAO.save(user);
    }

    public User getUserById(int id) {
        return userDAO.findOne(id);
    }

    public void delete(int id) {
        userDAO.delete(id);
    }

    public List<User> listUsers() {
        return userDAO.findAll();
    }

    public User findByUserName(String username) {
        return userDAO.findByUserName(username);
    }


}

