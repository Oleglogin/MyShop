package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Preview;

import java.util.List;

/**
 * Created by User on 14.04.2019.
 */
public interface PreviewDAO extends JpaRepository<Preview, Integer> {

    @Query("from Preview p where p.product.id=:id")
    List<Preview>elsePhoto(@Param("id")int id);
}
