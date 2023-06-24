require 'rails_helper'

RSpec.describe Comment, type: :model do
  attr_accessor :comment, :comment_two, :user_id, :post_id, :response, :just_comment_text

  context 'associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  context 'validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'CommentQuery' do
    before(:all) do
      @comment = FactoryBot.create(:comment)
      @just_comment_text = @comment.comment
      @user_id = comment.user.id
      @post_id = comment.post.id
    end

    context 'search by comment_cont' do
      before do
        @response = described_class.__search(comment_cont: comment)
      end

      it 'response match to search params' do
        response.map do |comment|
          expect(comment.comment).to include(just_comment_text)
          expect(comment.post_id).to eq(post_id)
          expect(comment.user_id).to eq(user_id)
        end
      end
    end
  end
end
