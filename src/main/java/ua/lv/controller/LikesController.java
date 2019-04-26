package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.lv.entity.Likes;
import ua.lv.entity.Product;
import ua.lv.entity.User;
import ua.lv.service.LikesService;
import ua.lv.service.ProductService;
import ua.lv.service.UserService;

import java.security.Principal;
import java.util.List;

/**
 * Created by User on 17.04.2019.
 */
@Controller
public class LikesController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    LikesService likeService;

    @RequestMapping(value = "/addLike/{currentUser.id}/{product.id}")
    public String addLike(Model model, Principal principal,
                          @PathVariable("currentUser.id")int UserId,
                          @PathVariable("product.id")int ProductId,
                          @ModelAttribute("emptyLike")Likes likes){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        User user = userService.getUserById(UserId);
        Product product = productService.findProductById(ProductId);
        likes.setUser(user);
        likes.setProduct(product);

        likes.setLikeCount(likes.getLikeCount() + 1);
        likeService.addLike(likes);
        int cl = product.getToLike();
        productService.toLike(ProductId,cl+1);
        return "redirect:/welcome";
    }

}
