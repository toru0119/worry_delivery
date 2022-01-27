class Public::NewEmployeesController < ApplicationController
  def index
    @new_employee = NewEmployee.all
  end
end
