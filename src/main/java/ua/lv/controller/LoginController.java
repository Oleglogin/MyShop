package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.lv.service.ProductService;

/**
 * Created by User on 09.03.2019.
 */
@Controller
public class LoginController {


    @Autowired
    ProductService productService;

    @RequestMapping(value = "/login")
    public String toLogin(Model model){
        model.addAttribute("productSortList",productService.productSortList());

        return "/login";
    }
}
