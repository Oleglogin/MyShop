package ua.lv.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
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

    @Query("from Likes likes where likes.user.id=:id")
    List<Likes> likesList(@Param("id")int id);

    @Modifying
    @Query("delete from Likes likes where likes.user.id=:uId and likes.product.id=:pId")
    void deleteLike(@Param("pId")int pid,@Param("uId")int uid);


    @Query("from Likes likes where likes.user.id=:uId and likes.product.id=:pId ")
    Likes likesByUserIdAndProducrId(@Param("pId")int pid,@Param("uId")int uid);


}

