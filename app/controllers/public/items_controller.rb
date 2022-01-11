class Public::ItemsController < ApplicationController
  def index
    # 商品IDを指定したまま商品の一覧はできるのか。そのまま商品の個数とカートに入れるようにしたい。
    @items = Item.all
    @item = Item.page(params[:page]).per(10)
    @cart_items = CartItem.new
  end
end
