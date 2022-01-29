class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items.all
  end
  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.amount += params[:cart_item][:amount].to_i
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path, notice: "カート内に商品を追加しました"
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: '商品の数量を変更しました'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "商品をカート内から削除しました"
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path, notice: "全ての商品をカート内から削除しました"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
