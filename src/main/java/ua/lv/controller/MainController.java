package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.lv.entity.Likes;
import ua.lv.entity.User;
import ua.lv.service.*;

import java.security.Principal;

/**
 * Created by User on 09.03.2019.
 */
@Controller
public class MainController {

    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    PreviewService previewService;
    @Autowired
    LikesService likesService;



    @GetMapping(value ="/")
    public String toMainPage(Model model, Principal principal){
        model.addAttribute("productList",productService.productList());
        model.addAttribute("previewList",previewService.prewievList() );
        model.addAttribute("productSortList",productService.productSortList());
        return "welcome";
    }

    @GetMapping(value ="/welcome")
    public String toWelcomePage(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("productList", productService.productList());
        model.addAttribute("previewList",previewService.prewievList());;
        model.addAttribute("countProductInBasket", purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("emptyLike", new Likes());
        return "/welcome";
    }

}
