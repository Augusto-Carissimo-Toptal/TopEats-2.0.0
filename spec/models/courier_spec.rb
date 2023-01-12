require 'rails_helper'

RSpec.describe Courier do
  context 'associations' do
    it { should belong_to(:users) }
    it { should have_many(:orders) }
    it { should have_many(:vehicles) }
  end
end
