# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
   before_action :authenticate_admin!,except: [:top, :about]
  # before_action :configure_sign_in_params, only: [:create]

  # ログイン後の遷移先
  def after_sign_in_path_for(resouce)
    admin_items_path
  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resouce)
    new_admin_session_path
  end

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
end
