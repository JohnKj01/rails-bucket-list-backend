class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: [:is_logged_in?, :create]

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok, serializer: UserSerializer
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: "Logged out successfully" }
  end

  def is_logged_in?
    if current_user
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false }
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
