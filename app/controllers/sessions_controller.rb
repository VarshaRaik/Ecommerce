class SessionsController < ApplicationController
    def show 
        @user = User.find(params[:id])
    end
    def new 
    end 
    def create
        @user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password] && params[:password_confirmation])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Logged in successfully'
        else
            flash.now[:alert] = 'Invalid email or password'
            render :new
          end
    end
    def destroy
        # deletes user session
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged Out'
      end
      def destroy
        @user= User.find(params[:id])
        @user.destroy
    
        redirect_to root_path
      end
  
        private
        def user_params
          # strong parameters
          params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
        end
end
