require 'rails_helper'

RSpec.describe Posts::Destroy do
  attr_accessor :post

  before(:all) do
    @post = FactoryBot.create(:post)
  end

  describe '#initialize' do
    before do
      @instance = described_class.new(post)
    end

    it 'returns instancied variables' do
      expect(@instance.post).to eq(post)
    end
  end

  describe '#execute' do
    context 'when no errors happens' do
      before do
        @instance = described_class.new(post)
        @instance.execute
      end

      it 'should destroy the post' do
        expect(Post.where(id: post.id).count).to eq(0)
      end
    end
  end
end
