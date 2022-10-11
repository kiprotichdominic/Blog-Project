class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      token = issue_token(user)
      render json: { user: UserSerializer.new(user),jwt: token,},status: :created
    else
      if user.errors.messages
        render json: { error: user.errors.messages}, status: :unprocessable_entity
      else
        render json: { error: "User could not be created. Please try again." }
      end
    end
  end

  private

  def user_params
    params.permit(:name,:username,:email, :password)
  end
end
