package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 14.04.2019.
 */
@Controller
public class CurtController {

    @Autowired
    UserService userService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String toCart(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        model.addAttribute("productListInCurt", purchaseService.productListInCurt(byUserName.getId()));
        model.addAttribute("amountPrice", purchaseService.amountInCart(byUserName.getId(),0));
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productSortList",productService.productSortList());

        return "cart";
    }
}
