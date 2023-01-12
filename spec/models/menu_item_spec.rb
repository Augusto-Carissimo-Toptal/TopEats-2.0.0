require 'rails_helper'

RSpec.describe MenuItem do
  context 'validations' do
    it { should validate_presence_of(:name) } 
  end

  context 'associations' do
    it { should have_many(:orders) }
  end
end