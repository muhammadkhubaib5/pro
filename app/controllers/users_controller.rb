class UsersController < ApplicationController

	before_filter :authenticate, only: [:show]

def index
	@user = User.all 
end

def show
	@user = User.find(params[:id])
end 

def create
	@user = User.create( 
		f_name: params[:user][:f_name],
		l_name: params[:user][:l_name],
		username: params[:user][:username],
		email: params[:user][:email],
		password: params[:user][:password]
		)
	if @user.save
		redirect_to @user, notice: "Account has been successfully created"
	else
		render 'new'
	end
end

def new
	@user = User.new
end

def login
	session[:id] = nil
	@user = ''
end

def process_login
	username = params[:username]
	password = params[:password]
	session[:username] = username
	session[:password] = password
	user = User.where(username: username, password: password).first
	if user.present?
		session[:id] = user.id
		redirect_to user_path(session[:id])
	else
		redirect_to login_users_path, notice: "Please sign in with Valid Username or Password."
	end
end

def logout

	session[:logout] = true
	redirect_to action: "process_login" , notice: "You are successfully logout"
	#binding.pry
end
end
