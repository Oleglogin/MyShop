package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.Product;
import ua.lv.entity.Purchase;
import ua.lv.entity.User;
import ua.lv.service.*;

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
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    PreviewService previewService;
    @Autowired
    LikesService likesService;

    @RequestMapping(value = "/product/add",method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("emptyProduct")Product product,
                              Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        product.setUser(byUserName);
        productService.save(product);
        return "redirect:/admin";
    }

    @RequestMapping(value = "productRemove/{id}")
    public String productDelete(@PathVariable("id") int id){
        productService.delete(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "productEdit/{id}", method = RequestMethod.GET)
    public String productEdit(@PathVariable("id") int id, Model model,
                              Principal principal) {
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser",byUserName);
        model.addAttribute("productList", productService.productList());
        model.addAttribute("emptyProduct", productService.findProductById(id));
        return "admin";
    }


    @RequestMapping(value = "productData/{id}", method = RequestMethod.GET)
    public String toProductData(Model model,Principal principal,
                                @PathVariable("id")int id){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("emptyPurchase", new Purchase());
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId()));

        model.addAttribute("product", productService.findProductById(id));
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("previewList", previewService.prewievList());
        return "product";
    }
    @RequestMapping(value = "sortByCategory/{category}", method = RequestMethod.GET)
    public String sortCategory(Model model, Principal principal,
                               @PathVariable("category")String category){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId()));
        model.addAttribute("productList",productService.sortByCategory(category));
        return "welcome";
    }

    @RequestMapping(value = "sortBySubCategory/{category}", method = RequestMethod.GET)
    public String sortSubCategory(Model model, Principal principal,
                               @PathVariable("category")String category){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId()));
        model.addAttribute("productList",productService.sortBySubCategory(category));
        return "welcome";
    }
}
