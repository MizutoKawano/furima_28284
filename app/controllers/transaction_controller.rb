class TransactionController < ApplicationController
  before_action :back, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @Transaction = ItemTransaction.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = ItemTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render :index
    end
   end

  private

  def back
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.payment.nil?
  end

  def transaction_params
    params.permit(:token, :postnum, :arium_id, :city, :house_number, :building_name, :tellnum, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
