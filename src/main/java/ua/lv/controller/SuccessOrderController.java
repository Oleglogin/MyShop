package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.lv.entity.SuccessOrder;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 18.04.2019.
 */
@Controller
public class SuccessOrderController {

    @Autowired
    UserService userService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    ProductService productService;



    @GetMapping(value = "/checkout")
    public String toCheckOut(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        model.addAttribute("productListInCurt", purchaseService.productListInCurt(byUserName.getId()));
        model.addAttribute("amountPrice", purchaseService.amountInCart(byUserName.getId()));
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId()));
        model.addAttribute("productSortList",productService.productSortList());

        model.addAttribute("emptySuccessOrder", new SuccessOrder());

        return "checkout";
    }
}
