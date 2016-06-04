require 'rails_helper'

RSpec.describe SupplyItem, type: :model do

    it { should belong_to(:family) }
    it { should belong_to(:supply) }
end
