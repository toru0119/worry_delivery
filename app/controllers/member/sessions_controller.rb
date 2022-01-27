# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController
  before_action :authenticate_member!,except: [:top, :about]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # 新入社員がログイン後の遷移先
  def after_sign_in_path_for(resource)
    member_new_employees_path
  end

  # 新入社員がログアウト後の遷移先
  def after_sign_out_path_for(resource)
    new_new_employee_session_path
  end
end