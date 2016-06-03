class SupplyItem < ActiveRecord::Base
  belongs_to :family
  belongs_to :supply
end
