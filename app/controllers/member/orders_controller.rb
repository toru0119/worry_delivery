class Member::OrdersController < ApplicationController
  before_action :authenticate_new_employee!
  def index
    # 新しい順
    @orders = Order.all.order(created_at: :desc)
    @order = Order.page(params[:page]).per(10)
  end

  def show
    @order= Order.find(params[:id])
    @order_detail= @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to member_orders_path
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
