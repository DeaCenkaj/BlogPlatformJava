package com.dea.codingdojo.blogplatform.services;

import com.dea.codingdojo.blogplatform.models.Post;
import com.dea.codingdojo.blogplatform.models.User;
import com.dea.codingdojo.blogplatform.repositories.PostRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PostService {

    @Autowired
    private PostRepo postRepo;

    public List<Post> allPosts() {
        return postRepo.findAll();
    }

    public List<Post> getPostsByType(String type) {
        return postRepo.findByType(type);
    }

    public Post updatePost(Post post) {
        return postRepo.save(post);
    }

    public Post addPost(Post post) {
        return postRepo.save(post);
    }

    public Post edit(Post post) {
        if (postRepo.existsById(post.getId())) {
            return postRepo.save(post);
        }
        throw new RuntimeException("Post not found: " + post.getId());
    }

    public void deletePost(Post post) {
        postRepo.delete(post);
    }

    public Post findById(Long id) {
        Optional<Post> optionalPost = postRepo.findById(id);
        if (optionalPost.isPresent()) {
            return optionalPost.get();
        } else {
            return null;
        }
    }
    public List<Post> findPostsByUserId(Long userId) {
        return postRepo.findByUsers_Id(userId);
    }

}
