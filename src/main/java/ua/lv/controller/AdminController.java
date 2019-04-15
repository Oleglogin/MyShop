package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import ua.lv.entity.Preview;
import ua.lv.entity.Product;
import ua.lv.entity.User;
import ua.lv.service.PreviewService;
import ua.lv.service.ProductService;
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
        return "admin";
    }
}
