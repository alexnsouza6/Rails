# Sessions Controller handles Sessions stuff
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id # Saving user id in the session. The browser cookies handles this
      flash[:success] = 'Logged in Successufully'
			redirect_to user_path(user)
		else
			flash.now[:danger] = 'Something wrong with login info'
			render 'new'
		end
  end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end
