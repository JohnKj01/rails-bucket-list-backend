class ApplicationController < ActionController::Base
      before_action :authorize_request

      private

      def authorize_request
            @current_user = User.find_by(id: session[:user_id])
            render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
      end

      def current_user
            @current_user
      end  
end