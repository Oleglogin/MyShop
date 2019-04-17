package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.LikesDAO;
import ua.lv.entity.Likes;
import ua.lv.service.LikesService;

import java.util.List;

/**
 * Created by User on 17.04.2019.
 */
@Transactional
@Service
public class LikesServiceImpl implements LikesService {
    @Autowired
    LikesDAO likeDAO;

    @Override
    public void addLike(Likes likes) {
        likeDAO.save(likes);
    }

    @Override
    public void deleteLike(int id) {
        likeDAO.delete(id);
    }

    @Override
    public List<Likes> likeList() {
        return likeDAO.findAll();
    }

    @Override
    public Likes findLikeById(int id) {
        return likeDAO.findOne(id);
    }

    @Override
    public void deleteL(int id) {
        likeDAO.deleteLike(id);
    }

//    @Override
//    public List<Likes> findLikesByProductId(int userId, int productId) {
//        return likeDAO.findLikesByProductIdAndUserId(userId,productId);
//    }
}
