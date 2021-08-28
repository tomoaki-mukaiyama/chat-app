class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        return @current_user if @current_user.present?
        if session[:user_id].present?
            if @current_user = User.find_by(id: session[:user_id])
                @current_user
            else
                @current_user = User.generate
                session[:user_id] = @current_user.id
                @current_user
            end
        else
            @current_user = User.generate
            session[:user_id] = @current_user.id
            @current_user
        end
    end
end