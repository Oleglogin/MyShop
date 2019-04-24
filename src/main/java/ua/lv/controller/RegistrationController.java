package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.lv.entity.User;
import ua.lv.service.ProductService;
import ua.lv.service.UserService;
import ua.lv.validator.UserValidator;

import javax.validation.Valid;


/**
 * Created by User on 09.03.2019.
 */
@Controller
public class RegistrationController {
    @Autowired
    UserService userService;
    @Autowired
    UserValidator userValidator;
    @Autowired
    ProductService productService;

    @GetMapping("/registration")
    public String toRegistration(Model model){
        model.addAttribute("productSortList",productService.productSortList());

        model.addAttribute("emptyUser", new User());
        return "registration";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveUserSpringForm")
    public String saveUser(@ModelAttribute ("emptyUser") @Valid User user,
                           BindingResult bindingResult){
        userValidator.validate(user,bindingResult);
        if(bindingResult.hasErrors()){
            return "registration";
        }
        userService.save(user);

        return "redirect:/login";
    }


}
