require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user_admin = 
    @user_not_admin= 
    @post_three = 
  end

  let(:root_keys) { %w[user] }
  let(:expected_user_keys) { %w[:name, :email, :encrypted_password, :kind, :username] }
  let(:expected_meta_keys) { %w[current_page per_page total_pages total_count] }
  let(:error_root_keys) { %w[error] }
  let(:expected_error_keys) { %w[message] }
  let(:params) do
    {
      user: {
        name: Faker::Quote.yoda,
        email: Faker::Lorem.characters(number: 15),
        encrypted_password: ,
        username:
      }
    }
    describe 'GET #index' do
      before do
        get :index
        @body = JSON.parse(response.body)
      end

      it 'return status code :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render all Users'
    end
  end
end
