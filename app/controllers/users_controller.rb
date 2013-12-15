class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			auto_login(@user)
			"Welcome to Superforum!"
			redirect_to topics_url, :notice => "Signed up!"
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	private
  	def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile)
  	end
end
