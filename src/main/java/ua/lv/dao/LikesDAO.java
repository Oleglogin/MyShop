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

    @Query("select sum (likes.likeCount) from Likes likes where likes.product.id=:id")
    int countLike(@Param("id")int id);

    @Query("select sum (likes.disLikeCount) from Likes likes where likes.product.id=:id")
    int countDisLike(@Param("id")int id);

    @Query("from Likes likes where likes.user.id=:id")
    List<Likes> likesList(@Param("id")int id);


}

