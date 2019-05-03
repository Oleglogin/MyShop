package ua.lv.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.LikesDAO;
import ua.lv.entity.Likes;
import ua.lv.entity.Product;
import ua.lv.entity.User;
import ua.lv.service.LikesService;
import ua.lv.service.ProductService;
import ua.lv.service.UserService;

import java.util.List;

/**
 * Created by User on 17.04.2019.
 */
@Transactional
@Service
public class LikesServiceImpl implements LikesService {
    @Autowired
    LikesDAO likeDAO;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;




    @Override
    public void addLike(Likes likes, int uId, int pId) {
        Likes likesByUserIdAndProductId = likeDAO.likesByUserIdAndProducrId(pId, uId);
        if(likesByUserIdAndProductId == null){
            int cl = productService.findProductById(pId).getToLike();
            productService.toLike(pId, cl + 1);
            likeDAO.save(likes);
        }
        else if(likesByUserIdAndProductId.getUser().getId() == uId && likesByUserIdAndProductId.getProduct().getId() == pId){
            int cl = productService.findProductById(pId).getToLike();
            productService.toLike(pId, cl - 1);
            likeDAO.deleteLike(pId,uId);
        }else {
            int cl = productService.findProductById(pId).getToLike();
            productService.toLike(pId, cl + 1);
            likeDAO.save(likes);
        }
    }


    @Override
    public void deleteLike(int id) {
        likeDAO.delete(id);
    }

    @Override
    public List<Likes> likeList()  {
        return likeDAO.findAll();
    }

    @Override
    public Likes findLikeById(int id) {
        return likeDAO.findOne(id);
    }

    @Override
    public int countLike(int id) {
        return likeDAO.countLike(id);
    }



    @Override
    public List<Likes> likesList(int id) {
        return likeDAO.likesList(id);
    }


}
