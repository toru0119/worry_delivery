class Admin::NewEmployeesController < ApplicationController
  def index
    @new_employees = NewEmployee.all
  end
end
