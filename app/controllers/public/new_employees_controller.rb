class Public::NewEmployeesController < ApplicationController
  def index
    @new_employees = new_employee.all
  end
end
