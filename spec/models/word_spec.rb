require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do 
    it { should have_db_column(:value) }
    it { should have_db_column(:language) }
  end

  describe 'validations' do 
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:language) }
  end
end
