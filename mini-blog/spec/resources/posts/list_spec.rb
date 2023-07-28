require 'rails_helper'

RSpec.describe Posts::List do
  attr_accessor :posts

  before(:all) do
    @posts = FactoryBot.create_list(:post, 3)
  end
  describe '#initialize' do
    before do
      @instance = described_class.new(posts)
    end

    it 'returns instancied variables' do
      expect(@instance.params).to eq(posts)
    end
  end

  describe '#execute' do
    context 'when searching by id' do
      before do
        params = { id: posts.first.id }
        @response = described_class.new(params).execute
      end

      it 'should calls the __search method on Post with ID as a params' do
        expect(@response).to include(posts.first)
      end
    end

    context 'when searching title' do
      before do
        params = { title: posts.first.title }
        @response = described_class.new(params).execute
      end

      it 'should calls the __search method on Post with title as a params' do
        expect(@response).to include(posts.first)
      end
    end

    context 'when searching description' do
      before do
        params = { description: posts.first.description }
        @response = described_class.new(params).execute
      end

      it 'should calls the __search method on Post with description as a params' do
        expect(@response).to include(posts.first)
      end
    end

    context 'when searching comments' do
      before do
        params = { description: posts.comments_comment }
        @response = described_class.new(params).execute
      end

      it 'should calls the __search method on Post with comments as a params' do
        expect(@response).to include(posts.first)
      end
    end
  end
end
