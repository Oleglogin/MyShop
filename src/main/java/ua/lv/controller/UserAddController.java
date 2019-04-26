package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.lv.entity.User;
import ua.lv.entity.UserAdd;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserAddService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 20.04.2019.
 */
@Controller
public class UserAddController {
    @Autowired
    UserService userService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    ProductService productService;
    @Autowired
    UserAddService userAddService;



    @GetMapping(value = "/checkout")
    public String toCheckOut(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("userAdd",userAddService.findOneByUserId(byUserName.getId()));
        model.addAttribute("emptyUserAdd", new UserAdd());
        model.addAttribute("productListInCurt", purchaseService.productListInCurt(byUserName.getId()));
        model.addAttribute("amountPrice", purchaseService.amountInCart(byUserName.getId(),0));
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productSortList",productService.productSortList());
        return "checkout";
    }
    @GetMapping(value = "regularAddress")
    public String regularAddress(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("emptyUserAdd",userAddService.findOneByUserId(byUserName.getId()));
        model.addAttribute("productListInCurt", purchaseService.productListInCurt(byUserName.getId()));
        model.addAttribute("amountPrice", purchaseService.amountInCart(byUserName.getId(),0));
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productSortList",productService.productSortList());
        return "checkout";
    }

    @RequestMapping(value = "successOrder")
    public String successOrder(@ModelAttribute("emptyUserAdd")UserAdd userAdd,
                               Principal principal, Model model){

        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        purchaseService.successOrder(byUserName.getId(),1);
        userAdd.setUser(byUserName);
        userAddService.addUserSave(userAdd);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/user/{id}")
    public String toUser(@PathVariable("id")int id,
                         Model model,Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("purchaseList", purchaseService.purchaseList());
        model.addAttribute("userAddList", userAddService.finddAllByUserId(id));
        return "adminOrder";

    }
}
