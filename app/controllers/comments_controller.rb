class CommentsController < ApplicationController
	before_filter :load_subject

	def new
		@comment = Comment.new
	end

	def create
		@comment = @comment.subjects.build(subject_params)
	end

	def update
		@comment = Comment.find(params[:id])

		if @comment.update_attributes(subject_params)
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
