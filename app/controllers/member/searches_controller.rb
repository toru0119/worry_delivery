class Member::SearchesController < ApplicationController
  def search
    @customers = Customer.search(params[:keyword])
    @new_employees = NewEmployee.search(params[:keyword])
  end
end
