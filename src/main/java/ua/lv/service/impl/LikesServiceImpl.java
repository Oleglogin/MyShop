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
    public int countLike(int id) {
        int lc = likeDAO.countLike(id);
        if(lc==0){
            return 0;
        }else{
            return likeDAO.countLike(id);
        }
    }

    @Override
    public int disLikeCount(int id) {
        int lc = likeDAO.countDisLike(id);
        if(lc==0){
            return 0;
        }else{
            return likeDAO.countDisLike(id);
        }
    }
}
