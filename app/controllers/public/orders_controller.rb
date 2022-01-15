class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def complete
    order = Order.new(session[:order])
    order.save

    if session[:new_address]
      address = current_customer.addresses.new
      address.postal_code = order.postal_code
      address.address = order.address
      address.name = order.name
      address.save
      session[:new_address] = nil
    end

    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_details = OrderDetail.new
      order_details.order_id = order.id
      order_details.item_id = cart_item.item.id
      oorder_details.amount = cart_item.amount
      order_details.making_status = 0
      order_details.save
    end

    session.delete(:order)
    session[:order] = nil
    cart_items.destroy_all
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
      order_detail.order_status = 0
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
    else
      render :new
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  private

  def order_params
    params.require(:order).permit(:new_employee, :name)
  end
end
