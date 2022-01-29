class Public::NewEmployeesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @new_employee = NewEmployee.all
  end
end
