class Admin::NewEmployeesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @new_employees = NewEmployee.all
  end
end
