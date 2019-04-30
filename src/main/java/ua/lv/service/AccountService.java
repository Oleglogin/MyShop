package ua.lv.service;

import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 21.04.2019.
 */
public interface AccountService {
    void addUserSave(Account account);
    void deleteUserAdd(int id);
    List<Account> findAll();
    Account findOne(int id);
    Account findOneByUserId(int id,boolean regular);
    Account findOneByAccId(int id,boolean regular);
    List<Account>findAllByUserId(int id);
    void findAndChangeRegularAddress(boolean regular,boolean change, int id);
}
