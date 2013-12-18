class UsersController < ApplicationController
	def index
		@users = User.all
		if params[:tag]
      @items = Item.tagged_with(params[:tag])
    else
    	@items = Item.all
    end
	end

	def new
		@user = User.new
	end

	# def destroy
	# 	@message = Message.find(params[:id])
	# 	@message.destroy
	# 		redirect_to user_path(@user)
	# end

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
		@recipient = User.find(params[:id])
		if current_user
			@message = Message.new
			@message.recipient_id = @recipient.id
		end
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
