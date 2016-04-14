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
    @post.comments.destroy(params["comment_id"])
    redirect_to :root
  end
end
