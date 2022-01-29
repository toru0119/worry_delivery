class Member::CustomersController < ApplicationController
  before_action :authenticate_new_employee!
  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end
end
