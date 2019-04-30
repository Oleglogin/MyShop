package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.AccountDAO;
import ua.lv.entity.Account;
import ua.lv.service.AccountService;

import java.util.List;

/**
 * Created by User on 21.04.2019.
 */
@Service
@Transactional
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO accountDAO;

    @Override
    public void addUserSave(Account account) {
        accountDAO.save(account);
    }

    @Override
    public void deleteUserAdd(int id) {
        accountDAO.delete(id);
    }

    @Override
    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    @Override
    public Account findOne(int id) {
        return accountDAO.findOne(id);
    }

    @Override
    public Account findOneByUserId(int id,boolean regular) {
        return accountDAO.findOneByUserId(id,regular);
    }

    @Override
    public List<Account> findAllByUserId(int id) {
        return accountDAO.findAllByUserId(id);
    }
}
