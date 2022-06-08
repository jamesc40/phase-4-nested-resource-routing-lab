class ItemsController < ApplicationController

  
  def index

    if params[:user_id]
      items = find_user_items
    else
      items = Item.all
    end

    render json: items, include: :user

  end

  def show
    render json: find_item, status: :found 
  end

  def create
    user_items = find_user_items
    user_items.create(item_params)
    render json: user_items.last, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end

  def find_item
    Item.find(params[:id])
  end

  def find_user_items
    User.find(params[:user_id]).items
  end

end
