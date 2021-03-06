class NewEmployee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :new_employee
  has_many :orders

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def self.search(search)
    if search != ""
      NewEmployee.where('last_name LIKE(?) OR first_name LIKE(?) OR last_name_kana LIKE(?) OR first_name_kana LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      NewEmployee.all
    end
  end
end
