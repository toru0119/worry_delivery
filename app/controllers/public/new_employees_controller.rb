class Public::NewEmployeesController < ApplicationController
  def index
    @new_employee = new_employee.all
  end
end
