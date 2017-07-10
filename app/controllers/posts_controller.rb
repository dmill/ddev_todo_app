class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @post.comments.select {|comm| !current_user.blocked(comm)}
  end
end
