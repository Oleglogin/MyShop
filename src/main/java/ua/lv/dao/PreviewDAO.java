package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.lv.entity.Preview;

/**
 * Created by User on 14.04.2019.
 */
public interface PreviewDAO extends JpaRepository<Preview, Integer> {

}
