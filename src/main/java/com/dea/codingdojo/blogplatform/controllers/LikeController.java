package com.dea.codingdojo.blogplatform.controllers;

import com.dea.codingdojo.blogplatform.models.Post;
import com.dea.codingdojo.blogplatform.models.User;
import com.dea.codingdojo.blogplatform.services.LikeService;
import com.dea.codingdojo.blogplatform.services.PostService;
import com.dea.codingdojo.blogplatform.services.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
public class LikeController {

    private final LikeService likeService;
    private final PostService postService;
    private final UserService userService;

    @Autowired
    public LikeController(LikeService likeService, PostService postService, UserService userService) {
        this.likeService = likeService;
        this.postService = postService;
        this.userService = userService;
    }

    @PostMapping("/like/{postId}")
    public String likePost(@PathVariable Long postId, HttpSession session) {
        // Get the current user ID from the session
        Long userId = getCurrentUserId(session);

        // Check if the post exists
        Post post = postService.findById(postId);
        if (post == null) {
            // Handle post not found error
            return "redirect:/dashboard"; // You may want to show an error page instead
        }

        // Check if the user has already liked the post
        boolean alreadyLiked = post.getLike().stream()
                .anyMatch(like -> like.getUserId().equals(userId));

        if (!alreadyLiked) {
            // Like the post
            likeService.like(postId, userId);
        }

        return "redirect:/dashboard";
    }

    @PostMapping("/unlike/{postId}")
    public String unlikePost(@PathVariable Long postId, HttpSession session) {
        // Get the current user ID from the session
        Long userId = getCurrentUserId(session);

        // Check if the post exists
        Post post = postService.findById(postId);
        if (post == null) {
            // Handle post not found error
            return "redirect:/dashboard"; // You may want to show an error page instead
        }

        // Unlike the post
        likeService.unlike(postId, userId);

        return "redirect:/dashboard";
    }

    // Helper method to get the current user ID from the session
    private Long getCurrentUserId(HttpSession session) {
        // Replace this with your actual session-based authentication logic
        // For example, if you set the user ID in the session during login, retrieve it like this:
        Long userId = (Long) session.getAttribute("userId");
        return userId;
    }
}