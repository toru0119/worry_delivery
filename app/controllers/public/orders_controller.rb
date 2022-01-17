class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.all
    @customer = current_customer
    # 注文ステータスを選択したデータを取得
    # params[:order][:order_status]
  end

  def create
    @order = Order.find(params[:id])
    if @order.create(order_params)
      redirect_to order_complete_orders
    else
      render :new
    end
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  private

  def order_params
    params.require(:order).permit(:new_employee, :name)
  end
end
