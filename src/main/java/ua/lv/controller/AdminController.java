package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Preview;
import ua.lv.entity.Product;
import ua.lv.entity.Purchase;
import ua.lv.entity.User;
import ua.lv.service.PreviewService;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 13.04.2019.
 */
@Controller
public class AdminController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    PreviewService previewService;
    @Autowired
    PurchaseService purchaseService;

    @GetMapping("/admin")
    public String toAdminPAge(Model model,
                              Principal principal,
                              @ModelAttribute("emptyProduct")Product product,
                              @ModelAttribute("emptyPreview")Preview preview){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("productList", productService.productList());
        model.addAttribute("previewList", previewService.prewievList());
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        return "admin";
    }
    @RequestMapping(value = "/admin2/{id}", method = RequestMethod.GET)
    public String toAdmin2(Model model, Principal principal,
                           @ModelAttribute("emptyPreview")Preview preview,
                           @PathVariable("id")int id){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("product", productService.findProductById(id));
        model.addAttribute("elsePhoto",previewService.elsePhoto(id));
        return "admin2";

    }

    @RequestMapping(value = "/adminOrder", method = RequestMethod.GET)
    public String toAdminOrder(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("purchaseList", purchaseService.purchaseList());
        return "/adminOrder";
    }

}
