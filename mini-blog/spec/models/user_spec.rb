require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end

  describe 'UserQuery' do
    before(:all) do
      @user = FactoryBot.create(:user)
    end

    context 'when search for name' do
      before do
        @response = described_class.__search(name_cont: @user.name)
      end

      it 'response match to search param' do
        @response.map do |user|
          expect(user.name).to include(@user.name)
        end
      end
    end

    context 'when search for username' do
      before do
        @response = described_class.__search(username_cont: @user.username)
      end

      it 'response match to search param' do
        @response.map do |user|
          expect(user.username).to include(@user.username)
        end
      end
    end
  end
end
