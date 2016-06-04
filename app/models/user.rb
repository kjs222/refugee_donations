class User < ActiveRecord::Base

  has_secure_password
  validates :username, presence: true, uniqueness: true


  enum role: ["default", "admin"]

end
