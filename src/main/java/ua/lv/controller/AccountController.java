package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.lv.entity.Account;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.AccountService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 20.04.2019.
 */
@Controller
public class AccountController {
    @Autowired
    UserService userService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    ProductService productService;
    @Autowired
    AccountService accountService;



    @GetMapping(value = "/checkout")
    public String toCheckOut(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("account",accountService.findOneByUserId(byUserName.getId(),true));
        model.addAttribute("emptyAccount", new Account());
        model.addAttribute("productListInCurt", purchaseService.productListInCurt(byUserName.getId()));
        model.addAttribute("amountPrice", purchaseService.amountInCart(byUserName.getId(),false));
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),false));
        model.addAttribute("productSortList",productService.productSortList());
        return "checkout";
    }
    @GetMapping(value = "/regularAddress/{id}")
    public String regularAddress(Model model, Principal principal,
                                 @PathVariable("id")int id){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        model.addAttribute("emptyAccount", accountService.findOneByAccId(id,true));

        model.addAttribute("productListInCurt", purchaseService.productListInCurt(byUserName.getId()));
        model.addAttribute("amountPrice", purchaseService.amountInCart(byUserName.getId(),false));
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),false));
        model.addAttribute("productSortList",productService.productSortList());
        return "checkout";
    }

    @RequestMapping(value = "/successOrder")
    public String successOrder(@ModelAttribute("emptyUserAdd")Account account,
                               Principal principal, Model model){

        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        purchaseService.successOrder(byUserName.getId(),true);

        account.setUser(byUserName);
        accountService.findAndChangeRegularAddress(true,false,byUserName.getId());
        accountService.addUserSave(account);
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/user/{id}")
    public String toUser(@PathVariable("id")int id,
                         Model model,Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("purchaseList", purchaseService.purchaseList());
        model.addAttribute("userAddList", accountService.findAllByUserId(id));
        return "adminOrder";

    }
}
