class SubjectsController < ApplicationController
	before_filter :load_topic
	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(subject_params)
		@subject.topic_id = @topic.id

		if @subject.save
			redirect_to topic_path(@topic)
		else
			render :new
		end
	end

	def show
  		@subject = Subject.find(params[:id])
  		@comment = Comment.new
 	end

	private
	def subject_params
  	params.require(:subject).permit(:name, :description, :topic_id)
  	end

  	def load_topic
  		@topic = Topic.find(params[:topic_id])
  	end

 
end
