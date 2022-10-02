class PostsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create,:index,:show]
  before_action :set_post, only: [:show, :destroy]

  def index
    render json: Post.all, status: :ok
  end
  def show
    render json: post, status: :ok
  end
  def create
  end

  private

  def post_params
    params.permit(:title,:content)
  end

  def set_post
    post = Post.find(params[:id])
  end
end
