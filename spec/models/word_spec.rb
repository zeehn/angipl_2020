require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do 
    it { should have_db_column(:value) }
    it { should have_db_column(:language) }
  end
end
