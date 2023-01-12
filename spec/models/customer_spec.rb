RSpec.describe Customer do
  context 'associations' do
    it { should belong_to(:users) }
    it { should have_many(:orders) }
  end
end
