class SessionsController < ApplicationController

    skip_before_action :logged_in, only: [:new,:create]

    def new
    end

    def create
        @user=User.find_by(name:params[:session][:name])

        if @user && @user.authenticate(params[:session][:password])
        session[:user_id]=@user.id
        redirect_to user_path(@user.id)
        else
            flash[:errors]=["username or password did not match"]
            redirect_to new_login_path
        end

    end

    def destroy
        session[:user_id]= nil
        redirect_to movies_path
    end

end
