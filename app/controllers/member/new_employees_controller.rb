class Member::NewEmployeesController < ApplicationController
  def index
    @new_employees = NewEmployee.all
  end
  def edit
    @new_employee = current_new_employee
  end

  def update
    @new_employee = current_new_employee
    if @current_new_employee.update(new_employee_params)
      redirect_to member_new_employees_path(@new_employee), notice: "内容を変更しました"
    else
      @new_employee = current_new_employee
      render "edit"
    end
  end

  private

  def new_employee_params
    params.require(:new_employee).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:new_employee,:introduction)
  end
  # アクセス権限を使うか
  def correct_new_employees
    @customers = Customer.find(params[:id])
    redirect_to(root_url) unless current_customer?(@customer)
  end
end