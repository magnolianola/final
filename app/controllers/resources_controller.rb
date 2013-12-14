class ResourcesController < ApplicationController
  def index
  	@resources = Resource.all
  end

  def show
  	@resource = Resource.find(params[:id])
  end

  def new
  	@resource = Resource.new
  end

  def edit
  	@resource = Resource.find(params[:id])
  end

  def create
  	@resource = Resource.new(resource_params)

  	if @resource.save
  		redirect_to resources_url
  	else
  		render :new
  	end
  end

  def update
  	@resource = Resource.find(params[:id])

  	if @resource.update_attributes(resource_params)
  		redirect_to resource_path(@resource)
  	else
  		render :edit
  	end
  end
end
