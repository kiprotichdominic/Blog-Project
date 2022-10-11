class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index,:show]
  # before_action :set_post, only: [:show, :destroy]

  def index
    render json: Post.all, status: :ok
  end
  def show
    post = Post.find_by(params[:id])
    render json: post, status: :ok
  end

  def create
    user = User.find_by(id: params[:user_id])
    if !user
      render json: { error: "Login to create post" }
    else
      post = user.posts.build(post_params)
      post.save
      if post.valid?
          render json: post, status: :created
      else
          render json: { errors: post.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(post_params)
    render json: post
  end

  def destroy
      post = Post.find_by(id: params[:id])
      post.destroy
      head :no_content
  end

  private

  def post_params
    params.permit(:title,:content)
  end

  def set_post
    post = Post.find_by(params[:id])
  end
end
