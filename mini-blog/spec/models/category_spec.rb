require 'rails_helper'

RSpec.describe Category, type: :model do
  attr_accessor :category, :response, :category_name

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:posts) }
  end

  describe 'CategoryQuery' do
    before(:all) do
      @category = FactoryBot.create(:category, :with_posts)
      @category_name = category.name
    end

    context 'search by category name' do
      before do
        @response = described_class.__search(name_cont: category.name)
      end

      it 'response match to search param' do
        response.map do |category|
          expect(category.name).to include(category_name)
        end
      end
    end
  end
end
