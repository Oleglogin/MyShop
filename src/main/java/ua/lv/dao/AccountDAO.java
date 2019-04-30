package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Account;

import java.util.List;

/**
 * Created by User on 21.04.2019.
 */
public interface AccountDAO extends JpaRepository<Account,Integer> {
    @Query("from Account account where account.id=:id and account.regular=:regular")
    Account findOneByAccId(@Param("id")int id,@Param("regular")boolean regular);
    @Query("from Account account where account.id=:id")
    Account findOneByAccId(@Param("id")int id);

    @Query("from Account account where account.user.id=:id and account.regular=:regular")
    Account findOneByUserId(@Param("id")int id,@Param("regular")boolean regular);


    @Query("from Account account where account.user.id=:id")
    List<Account>findAllByUserId(@Param("id")int id);


    @Modifying
    @Query("update Account a set a.regular=:change where a.regular=:regular and a.user.id=:id")
    void findAndChangeRegularAddress(@Param("regular")boolean regular,@Param("change")boolean change,@Param("id")int id);

}
