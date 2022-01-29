class ApplicationController < ActionController::Base
  # before_action :authenticate_new_employee!,except: [:top, :about]
  # before_action :authenticate_customer!,except: [:top, :about]
  # before_action :authenticate_admin!,except: [:top, :about]

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name + " " + self.first_name
  end
end
