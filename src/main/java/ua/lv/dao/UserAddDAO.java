package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.UserAdd;

import java.util.List;

/**
 * Created by User on 21.04.2019.
 */
public interface UserAddDAO extends JpaRepository<UserAdd,Integer> {
    @Query("from UserAdd userAdd where userAdd.user.id=:id")
    UserAdd findOneByUserId(@Param("id")int id);


    @Query("from UserAdd userAdd where userAdd.user.id=:id")
    List<UserAdd>finddAllByUserId(@Param("id")int id);

}
