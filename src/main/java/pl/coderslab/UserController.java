package pl.coderslab;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/add")
    public String addTweet(Model model) {
        model.addAttribute("user", new User());
        return "user";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user";
        }
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect:../login";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        User user = userRepository.findFirstById(id);
        model.addAttribute("user", user);
        return "userUpdate";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute @Valid User user, BindingResult result) {
        if(result.hasErrors()) {
            return "userUpdate";
        }
        userRepository.save(user);
        return "redirect:../../";
    }

}
