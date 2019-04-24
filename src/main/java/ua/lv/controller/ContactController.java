package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.lv.entity.Product;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 22.04.2019.
 */
@Controller
public class ContactController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    PurchaseService purchaseService;

    @RequestMapping(value = "/contact")
    public String toContact(Model model, Principal principal){
        String principalName = principal.getName();
        User ByUser = userService.findByUserName(principalName);
        model.addAttribute("currentUser",ByUser);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("countProductInBasket", purchaseService.countProductInBasket(ByUser.getId(),0));
        return "/contact";

    }
}
