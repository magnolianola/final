class CommentsController < ApplicationController
	before_filter :load_subject

	def new
		@comment = Comment.new
	end

	def show
  		@comment = Comment.find(params[:id])
 	end

	def create
		@comment = @subject.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to topic_subject_path(@subject.topic, @subject)
		end
	end

	def update
		@comment = Comment.find(params[:id])

		if @comment.update_attributes(comment_params)
			redirect_to comment_subject_path(@comment.id, params[:id])
		else
			render :action => :new
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comment_path(@comment)
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	private
	def comment_params
		params.require(:comment).permit(:note, :user_id, :subject_id)
	end
	def load_subject
		@subject = Subject.find(params[:subject_id])
	end


end
