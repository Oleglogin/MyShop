package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.Product;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 13.04.2019.
 */
@Controller
public class ProductController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;

    @RequestMapping(value = "/product/add",method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("emptyProduct")Product product,
                              Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        product.setUser(byUserName);
        productService.save(product);
        return "redirect:/admin";
    }
}
