package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.Preview;
import ua.lv.entity.Product;
import ua.lv.entity.User;
import ua.lv.service.PreviewService;
import ua.lv.service.ProductService;
import ua.lv.service.PurchaseService;
import ua.lv.service.UserService;

import java.security.Principal;

/**
 * Created by User on 14.04.2019.
 */
@Controller
public class PreviewController {
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    UserService userService;
    @Autowired
    PreviewService previewService;
    @Autowired
    ProductService productService;

    @RequestMapping(value = "add/preview", method = RequestMethod.POST)
    public String savePreview(Model model, Principal principal,
                       @ModelAttribute("emptyPreview")Preview preview){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        previewService.addPrewien(preview);
        return "redirect:/admin";

    }
    @RequestMapping(value = "previewRemove/{id}")
    public String deletePreview(@PathVariable("id")int id, Model model, Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        previewService.deletePrewiev(id);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));

        return "redirect:/admin";
    }

    @RequestMapping(value = "/add/else/{id}", method = RequestMethod.POST)
    public String saveElse(Model model, Principal principal,
                           @ModelAttribute("emptyPreview")Preview preview,
                           @PathVariable("id")int id){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);

        Product product = productService.findProductById(id);
        model.addAttribute("product", productService.findProductById(id));
        preview.setProduct(product);
        previewService.addPrewien(preview);
        model.addAttribute("elsePhoto",previewService.elsePhoto(id));

        return "admin2";

    }
}
