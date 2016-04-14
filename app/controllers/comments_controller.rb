class CommentsController < ApplicationController
  before_action :authenticate!
  def create
    @post = Post.find(params["id"])
    @post.comments.create(body: params["body"],
                          user_id: current_user.id )
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params["id"])
#    binding.pry
    @comment = Comment.find(params["comment_id"])
    @comment.destroy
#    @post.comments.find(params["comment_id"]).destroy
#    @post.comments.find_by(id: params["comment_id"]).destroy
    redirect_to :root
  end
end
