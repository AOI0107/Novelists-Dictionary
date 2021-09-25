class PostsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_index_path
    else  
      render :new  
    end
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def edit
  end
 
  def update
    if @post.update(post_params)
      redirect_to posts_index_path
    else
      render :new
    end
  end
 
  def destroy
    @post.destroy
    redirect_to request.referer
  end
  private  
  def post_params
   params.require(:post).permit(:body)  
  end

  private
  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to new_post_path unless @post
  end
end

