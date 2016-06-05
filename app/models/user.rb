class User < ActiveRecord::Base

  has_secure_password
  has_many :supply_items
  validates :username, presence: true, uniqueness: true


  enum role: ["default", "admin"]

  def items_donated
    SupplyItem.where(user: self, status: "Received")
  end


  def items_pledged
    SupplyItem.where(user: self, status: "Pledged")
  end


end
