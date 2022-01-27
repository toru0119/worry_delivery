class ApplicationController < ActionController::Base

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name + " " + self.first_name
  end
end
