class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.all
    # 注文ステータスを選択したデータを取得
    # params[:order][:order_status]
  end

  def create
    # binding.pry
    @order = Order.new
    @order.address_id = params[:order][:addresses]
    @order.customer_id = current_customer.id
    if @order.save
      # 注文詳細の作成
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        # @○.カラム名
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_orders_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    @order_details = OrderDetail.all
  end

  private

  def order_params
    params.require(:order).permit(:new_employee, :name, :addresses)
  end
end
