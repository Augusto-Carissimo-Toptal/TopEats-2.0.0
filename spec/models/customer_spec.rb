require 'rails_helper'

RSpec.describe Customer do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:orders) }
  end
end
