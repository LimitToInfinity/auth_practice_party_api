class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:login]

  def login
    @user = User.find_by(username: params[:username])

    if @user
      
      if @user.authenticate(params[:password])
        payload = { user_id: @user.id }
        token = create_token(payload)

        render json: {
          username: @user.username,
          beverages: @user.beverages,
          token: token
        }
      else
        render json: { message: "Please try again!!!" }, status: :unauthorized
      end

    else
      render json: { message: "Please try again" }, status: :unauthorized
    end

  end

end
