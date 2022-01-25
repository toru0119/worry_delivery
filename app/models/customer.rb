class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :customer
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def self.search(search)
    if search != ""
      Customer.where(['last_name LIKE(?) OR first_name LIKE(?) OR last_name_kana LIKE(?) OR first_name_kana LIKE(?)', "%#{:last_name}%", "%#{:first_name}%", "%#{:last_name_kana}%", "%#{:first_name_kana}%"])
    else
      Customer.all
    end
  end

end
