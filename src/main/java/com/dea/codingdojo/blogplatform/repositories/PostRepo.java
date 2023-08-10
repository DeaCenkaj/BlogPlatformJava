package com.dea.codingdojo.blogplatform.repositories;

import com.dea.codingdojo.blogplatform.models.Post;
import com.dea.codingdojo.blogplatform.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Pageable;
import java.util.List;

@Repository
public interface PostRepo extends CrudRepository<Post, Long> {
    List<Post> findAll();


    List<Post> findByType(String type);

    List<Post> findByUsers_Id(Long userId);
}
