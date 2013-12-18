class ItemsController < ApplicationController
  # before_filter :ensure_logged_in, :only => [:edit, :create, :update, :destroy]
  before_filter :load_user

	def index
    if params[:tag]
      @items = Item.tagged_with(params[:tag])
    else
    	@items = Item.all
    end
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def create
    @item = @user.items.build(item_params)

    @item.user_id = current_user.id
    # respond_to do |format|
      if @item.save
        render :index
      else
        render :new
      end
  end

  def tag_cloud
    @tags = Item.tag_counts_on(:tags)
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update_attributes(item_params)
  		redirect_to user_items_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.destroy
  	redirect_to user_items_path
  end

  private
  def item_params
  	params.require(:item).permit(:name, :description, :user_id, :image, :tag_list)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
