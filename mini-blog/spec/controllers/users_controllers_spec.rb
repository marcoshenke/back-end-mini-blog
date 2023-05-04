require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
  end

  let(:root_keys) { %w[user] }
  let(:expected_user_keys) { %w[:name, :email, :encrypted_password, :admin, :username] }
  let(:expected_meta_keys) { %w[current_page per_page total_pages total_count] }
  let(:error_root_keys) { %w[error] }
  let(:expected_error_keys) { %w[message] }

  describe 'GET #index' do
    before do
      get :index
      @body = JSON.parse(response.body)
      @user = create(:user)
    end

    it 'return status code :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'return body json with all users' do
      get users_path(@user)
      expect(JSON.parse(response.body)).to eq(users)
    end
  end
end
