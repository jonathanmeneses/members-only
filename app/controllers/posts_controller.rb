class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    #
   @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "User Successfully Created"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
