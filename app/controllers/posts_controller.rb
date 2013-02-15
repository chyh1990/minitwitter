class PostsController < ApplicationController
  def index
    @post = Post.new
    @comment = Comment.new
    @posts = Post.find(:all, :limit => 50, :order => 'created_at DESC')
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
    end
  end

  def reply
    @post = Post.find(params[:postid])
    @comment = @post.comments.new(params[:comment])
    respond_to do |f|
      if @comment.save
        f.js
      end
    end
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.js
      else
      end
    end
  end
end

