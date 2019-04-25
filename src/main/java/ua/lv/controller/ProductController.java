package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ua.lv.entity.Product;
import ua.lv.entity.Purchase;
import ua.lv.entity.User;
import ua.lv.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));

        model.addAttribute("product", productService.findProductById(id));
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("previewList", previewService.prewievList());
        model.addAttribute("elsePhoto",previewService.elsePhoto(id));


        model.addAttribute("userLikeProduct",likesService.likesList(byUserName.getId()));

        return "product";
    }
    @RequestMapping(value = "sortByCategory/{category}", method = RequestMethod.GET)
    public String sortCategory(Model model, Principal principal,
                               @PathVariable("category")String category){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productList",productService.sortByCategory(category));
        return "welcome";
    }
    @RequestMapping(value = "sortByName/{name}", method = RequestMethod.GET)
    public String sortByName(Model model,Principal principal,
                             @PathVariable("name")String productBrand){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productList",productService.sortByName(productBrand));
        return "welcome";
    }

    @RequestMapping(value = "/search")
    public String Search(@RequestParam("searchString") String searchString,
                         Model model,Principal principal) {
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        if(searchString != null){
           model.addAttribute("productList",productService.search(searchString));
        }

        return "welcome";
    }
    @RequestMapping(value = "sortBySubCategory/{category}", method = RequestMethod.GET)
    public String sortSubCategory(Model model, Principal principal,
                               @PathVariable("category")String category){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productList",productService.sortBySubCategory(category));
        return "welcome";
    }
    @RequestMapping(value = "/expensive", method = RequestMethod.GET)
    public String expensive(Model model,Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productList",productService.expensive());
        return "welcome";
    }

    @RequestMapping(value = "/poor", method = RequestMethod.GET)
    public String poor(Model model,Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("productList",productService.poor());
        return "welcome";
    }

    @RequestMapping(value = "/popular", method = RequestMethod.GET)
    public String popular(Model model,Principal principal){
        String principalName = principal.getName();
        User byUserName = userService.findByUserName(principalName);
        model.addAttribute("currentUser", byUserName);
        model.addAttribute("countProductInBasket",purchaseService.countProductInBasket(byUserName.getId(),0));
        model.addAttribute("productSortList",productService.productSortList());
        model.addAttribute("productList",productService.popular());
        return "welcome";
    }

}
