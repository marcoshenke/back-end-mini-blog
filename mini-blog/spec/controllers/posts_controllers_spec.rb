require 'rails_helper'

RSpec.describe PostsController, :focus, type: :controller do
  attr_accessor :post_one, :post_two, :post_three

  before(:all) do
    posts = FactoryBot.create_list(:post, 3, :with_comments)

    @post_one = posts.first
    @post_two = posts.second
    @post_three = posts.third
  end

  let(:root_keys) { %w[post] }
  let(:expected_post_keys) { %w[id title description category_id user_id] }
  let(:expected_meta_keys) { %w[current_page per_page total_pages total_count] }
  let(:error_root_keys) { %w[error] }
  let(:expected_error_keys) { %w[message] }
  let(:params) do
    {
      post: {
        title: Faker::Quote.yoda,
        description: Faker::Lorem.characters(number: 15)
      }
    }
  end

  describe 'GET #index' do
    let(:root_keys) { %w[posts meta] }

    before do
      get :index
      @body = JSON.parse(response.body)
    end

    it 'return status code :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'match with root keys' do
      expect(@body.keys).to contain_exactly(*root_keys)
    end

    it 'match with posts keys' do
      @body['posts'].map do |post|
        expect(post.keys).to contain_exactly(*expected_post_keys)
      end
    end

    it 'match with meta keys' do
      expect(@body['meta'].keys).to contain_exactly(*expected_meta_keys)
    end
  end

  describe 'GET #show' do
    context 'when post does not exists' do
      let(:root_keys) { %w[error] }
      let(:expected_error_keys) { %w[message] }

      before do
        get :show, params: { id: Faker::Number.number }
        @body = JSON.parse(response.body)
      end

      it 'return status code :not_found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'match with root keys' do
        expect(@body.keys).to contain_exactly(*error_root_keys)
      end

      it 'match with post keys' do
        expect(@body['error'].keys).to contain_exactly(*expected_error_keys)
      end
    end

    context 'when post exists' do
      let(:expected_post_keys) { %w[id title description comments] }
      let(:expected_comment_keys) { %w[id comment created_at] }

      before do
        get :show, params: { id: post_one.id }
        @body = JSON.parse(response.body)
      end

      it 'return status code :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'match with root keys' do
        expect(@body.keys).to contain_exactly(*root_keys)
      end

      it 'match with post keys' do
        expect(@body['post'].keys).to contain_exactly(*expected_post_keys)
      end

      it 'match with comment keys' do
        @body['post']['comments'].map do |comment|
          expect(comment.keys).to contain_exactly(*expected_comment_keys)
        end
      end
    end
  end

  describe 'POST #create' do
    before do
      get :create, params: params
      @body = JSON.parse(response.body)
    end

    it 'return status code :created' do
      expect(response).to have_http_status(:created)
    end

    it 'match with root keys' do
      expect(@body.keys).to contain_exactly(*root_keys)
    end

    it 'match with post keys' do
      expect(@body['post'].keys).to contain_exactly(*expected_post_keys)
    end
  end

  describe 'PUT #update' do
    context 'when post does not exists' do
      before do
        put :update, params: params.merge({ id: Faker::Number.number })
        @body = JSON.parse(response.body)
      end

      it 'return status code :not_found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'match with root keys' do
        expect(@body.keys).to contain_exactly(*error_root_keys)
      end

      it 'match with post keys' do
        expect(@body['error'].keys).to contain_exactly(*expected_error_keys)
      end
    end

    context 'when post exists' do
      before do
        put :update, params: params.merge({ id: post_one.id })
        @body = JSON.parse(response.body)
      end

      it 'return status code :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'match with root keys' do
        expect(@body.keys).to contain_exactly(*root_keys)
      end

      it 'match with post keys' do
        expect(@body['post'].keys).to contain_exactly(*expected_post_keys)
      end
    end
  end

  describe 'DESTROY #destroy' do
    context 'when post does not exists' do
      before do
        delete :destroy, params: params.merge({ id: Faker::Number.number })
        @body = JSON.parse(response.body)
      end

      it 'return status code :not_found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'match with root keys' do
        expect(@body.keys).to contain_exactly(*error_root_keys)
      end

      it 'match with post keys' do
        expect(@body['error'].keys).to contain_exactly(*expected_error_keys)
      end
    end

    context 'when post exists' do
      before do
        delete :destroy, params: { id: post_one.id }
      end

      it 'return status code :no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
