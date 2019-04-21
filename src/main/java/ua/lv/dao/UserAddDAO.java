package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.lv.entity.UserAdd;

/**
 * Created by User on 21.04.2019.
 */
public interface UserAddDAO extends JpaRepository<UserAdd,Integer> {

}
