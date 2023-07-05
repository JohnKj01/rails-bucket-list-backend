class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
  
    def create
      if params[:password] == params[:password_confirmation]
        user = User.create!(user_params.slice(:name, :email, :password))
        render json: { message: "User created successfully" }, status: :created
      else
        render json: { errors: ["Password and password confirmation do not match"] }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
  