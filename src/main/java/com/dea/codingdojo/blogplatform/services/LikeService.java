package com.dea.codingdojo.blogplatform.services;

import com.dea.codingdojo.blogplatform.models.Comment;
import com.dea.codingdojo.blogplatform.models.Like;
import com.dea.codingdojo.blogplatform.repositories.LikeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
@Autowired
private LikeRepository likeRepository;

    public LikeService(LikeRepository likeRepository) {
        this.likeRepository = likeRepository;
    }

    public void like(Long postId, Long userId) {
        Like like = new Like();
        like.setPostId(postId);
        like.setUserId(userId);
        likeRepository.save(like);
    }

    public void unlike(Long postId, Long userId) {
        likeRepository.deleteByPostIdAndUserId(postId, userId);
    }

}