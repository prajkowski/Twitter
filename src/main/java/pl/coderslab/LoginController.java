package pl.coderslab;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@Scope("session")
public class LoginController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TweetRepository tweetRepository;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute @Valid User user, BindingResult result, Model model, HttpServletRequest request) {

//        if (result.hasErrors()) {
//            return "login";
//        }
        User userDb = userRepository.findByLogin(user.getLogin());
        boolean isLoggged = userDb != null && BCrypt.checkpw(user.getPassword(), userDb.getPassword());
        if (!isLoggged) {
            model.addAttribute("loginFailed", true);
            return "login";
        }

        request.getSession().setAttribute("user", userDb);
        request.getSession().setAttribute("tweets",  tweetRepository.findByUserIdOrderByCreationDateDesc(userDb.getId()));
        request.getSession().setAttribute("loggedIn", true);

        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.setAttribute("loggedIn", false);
        return "redirect:/";
    }

}
