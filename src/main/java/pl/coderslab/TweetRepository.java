package pl.coderslab;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet, Long> {

    Tweet findFirstById(Long id);

    List<Tweet> findByUserId(Long id);

    List<Tweet> findByTitleStartingWithOrderByCreationDate(String pattern);

    List<Tweet> findByUserIdOrderByCreationDateDesc(Long id);

}
