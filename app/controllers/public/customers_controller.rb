class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @current_customer.update(customer_params)
      redirect_to customers_path(@customer), notice: "内容を変更しました"
    else
      @customer = current_customer
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:customer,:business_outline)
  end
  def correct_customers
    @customers = Customer.find(params[:id])
    redirect_to(root_url) unless current_customer?(@customer)
  end
end
