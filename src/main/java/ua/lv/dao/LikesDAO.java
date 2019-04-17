package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.lv.entity.Likes;

import java.util.List;

/**
 * Created by User on 17.04.2019.
 */
public interface LikesDAO extends JpaRepository<Likes, Integer> {

    @Query("delete from Likes likes where likes.product.id=:id")
    void deleteLike(@Param("id")int id);

//    @Query("from Likes likes where likes.product.id=:productId and likes.user.id=:userId")
//    List<Likes> findLikesByProductIdAndUserId(@Param("product.id")int productId, @Param("user.id")int userId);
}
