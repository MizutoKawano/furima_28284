class ItemsController < ApplicationController
   before_action :move_to_index, except: [:index, :show]
  def index
   @items = Item.all.order("created_at DESC")
   
end

def show
 @item = Item.find(params[:id])
end

 def new
  @item =Item.new
 end

 def create
  @item =Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
 end

 def destroy
  @item =Item.find(params[:id])
  @item.destroy
 end

 def edit
  @item =Item.find(params[:id])
 end

private
def move_to_index
  redirect_to user_session_path  unless user_signed_in?
end

def item_params
params.require(:item).permit(:name, :image, :comment, :category_id, :status_id, :fee_id, :arium_id, :day_id, :price ).merge(user_id: current_user.id)
end
end