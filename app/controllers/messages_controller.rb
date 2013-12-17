class MessagesController < ApplicationController
	before_filter :require_login
	before_filter :load_sender

	def index
		@messages = Message.all
	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@message = Message.new
	end

	# def destroy
	# 	@message = Message.find(params[:id])
	# 	@message.destroy
	# 		redirect_to user_path(@user)
	# end

	def create
		@message = @user.messages.build(message_params)

   		@message.user_id = current_user.id
    
     	if @message.save
        	redirect_to user_path(@user)
      	else
        	render :new
      	end
	end

	private
	def message_params
  		params.require(:message).permit(:user_id, :title, :content, :recipient_id)
	end

	def load_sender
		@user = User.find(params[:user_id])
	end

	def load_recipient
		@recipient = User.find(params[:recipient_id])
	end
end
