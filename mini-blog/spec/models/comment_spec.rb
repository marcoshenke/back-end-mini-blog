require 'rails_helper'

RSpec.describe Comment, type: :model do
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
      @user = @comment.user
      @post = @comment.post
    end

    context 'search by comment_cont' do
      before do
        @response = described_class.__search(comment_cont: @comment)

        binding.pry
        @comment_two = response.comment.pluck(:comment).join(', ')
      end

      it 'response match to search params' do
        @response.map do |_comment|
          expect(comment_two).to include(@comment)
        end
      end
    end
  end
end
