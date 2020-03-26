class ApplicationController < ActionController::Base

    before_action :current_user
    before_action :logged_in

    def current_user
        @current_user=User.find_by(id: session[:user_id])
    end


    def logged_in
        if @current_user
        else
            redirect_to new_user_path
        end
    end




end
