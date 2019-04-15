package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.lv.entity.User;
import ua.lv.service.PreviewService;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

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



    @GetMapping("/")
    public String toMainPage(Model model){
        model.addAttribute("emptyProduct", productService.productList());
        model.addAttribute("productList",productService.productList());
        model.addAttribute("previewList",previewService.prewievList() );
        return "welcome";
    }

    @GetMapping("/welcome")
    public String toWelcomePage(Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("emptyProduct", productService.productList());
        model.addAttribute("productList", productService.productList());
        model.addAttribute("previewList",previewService.prewievList() );
        model.addAttribute("countProductInBasket", purchaseService.countProductInBasket(byUserName.getId()));
        return "welcome";
    }

}
