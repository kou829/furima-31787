class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_user_purchase, only: [:index, :create]
  def index
    @user_purchase = UserPurchase.new
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end


  end

  def create
    @user_purchase = UserPurchase.new(order_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_user_purchase
    @item = Item.find(params[:item_id])
  end


end
