class Public::SearchesController < ApplicationController
  def search
    # binding.pry
    @customers = Customer.search(params[:keyword])
    @new_employees = NewEmployee.search(params[:keyword])
  end
end
