package pl.coderslab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.awt.print.Book;

@Controller
@RequestMapping("/tweet")
public class TweetController {

    @Autowired
    TweetRepository tweetRepository;

    @GetMapping("/add")
    public String addTweet(Model model) {
        model.addAttribute("tweet", new Tweet());
        return "tweet";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute @Valid Tweet tweet, BindingResult result) {
        if (result.hasErrors()) {
            return "tweet";
        }
        tweetRepository.save(tweet);
        return "redirect:../";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        tweetRepository.deleteById(id);
        return "redirect:../..";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        Tweet tweet = tweetRepository.findFirstById(id);
        model.addAttribute("tweet", tweet);
        return "tweetUpdate";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute @Valid Tweet tweet, BindingResult result) {
        if(result.hasErrors()) {
            return "tweetUpdate";
        }
        tweetRepository.save(tweet);
        return "redirect:../../";
    }

}
