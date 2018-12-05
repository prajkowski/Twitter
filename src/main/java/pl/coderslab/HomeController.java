package pl.coderslab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;


    @GetMapping("/")
    public String home(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user!=null) {
            session.setAttribute("user", user);
            session.setAttribute("tweets",  tweetRepository.findByUserIdOrderByCreationDateDesc(user.getId()));
            return "tweetList";
        } else {
            return "redirect:/login";
        }
    }

}
