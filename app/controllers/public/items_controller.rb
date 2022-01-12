class Public::ItemsController < ApplicationController
  def index
    # 商品IDを指定したまま商品の一覧はできるのか。そのまま商品の個数とカートに入れるようにしたい。
    @items = Item.all
    @cart_item = CartItem.new
  end

  def create
    cart = Cart_item.new(params[:id])
    cart.save
    render index
  end
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount,)
  end
end
