class CommentsController < ApplicationController

  def create
    @post = Post.find(params["id"])
    @post.comments.create(body: params["body"])
    redirect_to post_path(@post)
  end
end
