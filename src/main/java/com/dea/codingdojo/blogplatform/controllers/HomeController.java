package com.dea.codingdojo.blogplatform.controllers;

import com.dea.codingdojo.blogplatform.models.Comment;
import com.dea.codingdojo.blogplatform.models.LoginUser;
import com.dea.codingdojo.blogplatform.models.Post;
import com.dea.codingdojo.blogplatform.models.User;
import com.dea.codingdojo.blogplatform.services.CommentService;
import com.dea.codingdojo.blogplatform.services.LikeService;
import com.dea.codingdojo.blogplatform.services.PostService;
import com.dea.codingdojo.blogplatform.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    @Autowired
    private LikeService likeService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/")
    public String index(Model model) {

        model.addAttribute("allPosts", postService.allPosts());

        return "index1";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);

        List<Post> allPosts = postService.allPosts(); // Get all posts
        allPosts.sort((post1, post2) -> post2.getCreatedAt().compareTo(post1.getCreatedAt())); // Sort in reverse order

        model.addAttribute("allPosts", allPosts);
        model.addAttribute("user", user);
        return "dashboard";
    }
    @GetMapping("/filter")
    public String filter(Model model, @RequestParam(name = "type", required = false) String type) {

        List<Post> posts;

        // If the type parameter is "all", get all posts
        if ("all".equalsIgnoreCase(type)) {
            posts = postService.allPosts();
        } else if (type != null && !type.isEmpty()) {
            // If a specific type is provided, filter the posts
            posts = postService.getPostsByType(type);
        } else {
            // Default to showing all posts
            posts = postService.allPosts();
        }

        // Sort the posts by creation date in descending order (newest to latest)
        posts.sort(Comparator.comparing(Post::getCreatedAt).reversed());

        // Set the filtered posts in the model
        model.addAttribute("filteredPosts", posts);

        // Set the posts in the model
        model.addAttribute("posts", posts);

        return "dashboard";
    }

    @GetMapping("/filter/all")
    public String showAllPosts(Model model) {
        List<Post> allPosts = postService.allPosts();

        // Set all posts in the model
        model.addAttribute("filteredPosts", allPosts);
        model.addAttribute("posts", allPosts);

        return "dashboard";
    }

    @PostMapping("/like")
    @ResponseBody
    public Map<String, Object> likePost(@RequestParam("postId") Long postId, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            // Perform logic to record the like, e.g., update database
            // You can return additional data as needed
            response.put("success", true);
            // ... other data ...
        } else {
            response.put("success", false);
            // ... other data ...
        }

        return response;
    }



    @GetMapping("/login")
    public String loginPage(@ModelAttribute("loginUser") LoginUser loginUser) {
        return "login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model, HttpSession session) {
        User user = userService.login(loginUser, result);
        session.setAttribute("userId", user.getId());
        return "redirect:/dashboard";
    }

    @GetMapping("/register")
    public String registerPage(@ModelAttribute("newUser") User newUser) {
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
        userService.register(newUser, result);

        session.setAttribute("userId", newUser.getId());

        return "redirect:/dashboard";
    }


    @GetMapping("/add-post")
    public String newPet(@ModelAttribute("addPost")Post post,HttpSession session, Model model){
        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);

        model.addAttribute("user", user);
        return "addPost";
    }

    @PostMapping("/add-post")
    public String addNewFilm(@Valid @ModelAttribute("post") Post post, BindingResult result, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "addPost";
        }else {
            postService.addPost(post);

            Long userId = (Long) session.getAttribute("userId");
            User user = userService.findById(userId);
            user.getPosts().add(post);
            userService.updateUser(user);
            return "redirect:/dashboard";
        }


    }
    @GetMapping("/viewPost/{postId}")
    public String viewPost(@PathVariable("postId") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Post post = postService.findById(id);
        model.addAttribute("post", post);
        return "viewPost";
    }
    @GetMapping("/post/edit/{postId}")
    public String openEditPost(@PathVariable("postId") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Post post = postService.findById(id);
        model.addAttribute("post", post);
        return "editPost";
    }
    @PostMapping("/post/edit/{postId}")
    public String editPost(@PathVariable("postId") Long id, @Valid @ModelAttribute("post") Post updatedPost,
                           BindingResult result, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        if (result.hasErrors()) {
            return "editPost";
        } else {
            Post existingPost = postService.findById(id);
            if (existingPost == null) {
                return "redirect:/dashboard";
            }

            Long userId = (Long) session.getAttribute("userId");
            User user = userService.findById(userId);

            existingPost.setTitle(updatedPost.getTitle());
            existingPost.setBody(updatedPost.getBody());
            existingPost.setType(updatedPost.getType());
            existingPost.setPhoto(updatedPost.getPhoto());

            postService.updatePost(existingPost);

            return "redirect:/dashboard";
        }
    }
    @GetMapping("/post/{id}/comments")
    public String viewPostComment(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("comment") Comment comment) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Post post = postService.findById(id);
        model.addAttribute("post", post);
        model.addAttribute("comments", commentService.postComments(id));
        return "comment";
    }

    @PostMapping("/post/{id}/comments")
    public String newPostComment(
            @PathVariable("id") Long id,
            HttpSession session,
            Model model,
            @Valid @ModelAttribute("comment") Comment comment, // Use "newComment" instead of "comment"
            BindingResult result) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        Post post = postService.findById(id);

        if (result.hasErrors()) {
            model.addAttribute("post", post);
            model.addAttribute("comments", commentService.postComments(id)); // Use a different attribute name
            return "comment";
        } else {
            Comment newComment = new Comment(comment.getName());
            newComment.setPost(post);
            newComment.setCreator(userService.findById(userId));
            commentService.addComment(newComment);
            return "redirect:/post/" + id + "/comments";
        }
    }

    @RequestMapping("/post/delete/{id}")
    public String deletePost(@PathVariable("id") Long id, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Post post = postService.findById(id);
        postService.deletePost(post);

        return "redirect:/dashboard";
    }


    @GetMapping("/profile")
    public String profile(@ModelAttribute("newLogin") LoginUser loginUser, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);

        List<Post> allPosts = postService.findPostsByUserId(userId); // Get all posts
        allPosts.sort((post1, post2) -> post2.getCreatedAt().compareTo(post1.getCreatedAt())); // Sort in reverse order

        model.addAttribute("allPosts", allPosts);
        model.addAttribute("user", user);
        return "profile";
    }




    // Add other CRUD operations (edit and delete) for posts and comments as needed
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.setAttribute("userId", null);
        return "redirect:/";
    }
}
