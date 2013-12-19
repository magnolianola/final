class SearchController < ApplicationController
  def index
    @search_place = Place.where('description LIKE ?', "%#{params[:search]}%").all
    @search_item = Item.where( "description LIKE '%#{params[:search]}%'").all
    @search_comment = Comment.where( "note LIKE '%#{params[:search]}%'").all
  end


end
