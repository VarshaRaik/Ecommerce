class RegistrationsController < ApplicationController
    def show 
        @user = User.find(params[:id])
    end
    def new 
        @user = User.new 
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Successfully created account'
        else
            render :new 
        end
    end

end
