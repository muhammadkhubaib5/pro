class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
  #	binding.pry
  	if session[:logout].present?
  		session[:id] = nil
			session[:username] = nil
			session[:password] = nil
			session[:logout] = false	
  	end

  	user = User.where(id: params[:id], username: session[:username], password: session[:password]).first
  	if user.present?
  		@current_user = user
  		true
  	else
  		redirect_to login_users_path, notice: "You are not authenticated person to view this page.."
  		false
  	end
  end
end
