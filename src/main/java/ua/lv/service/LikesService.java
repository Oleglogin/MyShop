package ua.lv.service;

import ua.lv.entity.Likes;

import java.util.List;

/**
 * Created by User on 17.04.2019.
 */
public interface LikesService {
    void addLike(Likes likes);
    void deleteLike(int id);
    List<Likes> likeList();
    Likes findLikeById(int id);

    int countLike(int id);
    int disLikeCount(int id);
}