package ua.lv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class AccessDeniedController {
    @RequestMapping(value = "/accessDenied",method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal principal){
        ModelAndView modelAndView = new ModelAndView();

        if(principal != null){
            modelAndView.addObject("errorMsg",principal.getName() + " \n" +
                    "you do not have access to the site");
        }
        modelAndView.setViewName("/accessDenied");
        return modelAndView;
    }
}
