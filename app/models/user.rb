class User < ActiveRecord::Base

  has_secure_password
  has_many :supply_items
  validates :username, presence: true, uniqueness: true


  enum role: ["default", "admin"]

end
