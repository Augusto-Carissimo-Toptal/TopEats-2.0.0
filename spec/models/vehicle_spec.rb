require 'rails_helper'

RSpec.describe Vehicle do
  context 'validations' do
    it { should define_enum_for(:vehicle_type).with(car: 'car', bicycle: 'bicycle', motorcycle: 'motorcycle').backed_by_column_of_type(:string) }
  end

  context 'associations' do
    it { should belong_to(:courier) }
  end
end