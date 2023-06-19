require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:description).is_at_least(10) }
  end

  context 'associations' do
    it { should have_many(:comments) }
  end

  describe 'PostQuery' do
    before(:all) do
      posts = FactoryBot.create_list(:post, 3, :with_comments)

      @post_one = posts.first
    end

    context 'search by id_eq' do
      before do
        @response = described_class.__search(id: @post_one.id)
      end

      it 'response match to search params' do
        @response.map do |post|
          expect(post.id).to eq(@post_one.id)
        end
      end
    end

    context 'search by title_cont' do
      before do
        @response = described_class.__search(title: @post_one.title)
      end

      it 'response match to search params' do
        @response.map do |post|
          expect(post.title.downcase).to include(@post_one.title.downcase)
        end
      end
    end

    context 'search by description_cont' do
      before do
        @response = described_class.__search(description: @post_one.description)
      end

      it 'response match to search params' do
        @response.map do |post|
          expect(post.description.downcase).to include(@post_one.description.downcase)
        end
      end
    end

    context 'search by comments_comment_cont' do
      before do
        @comment = @post_one.comments.first.comment

        @response = described_class.__search(comment: @comment)
      end

      it 'response match to search params' do
        @response.map do |post|
          binding.pry
          post_comments = post.comments.pluck(:comment).join(', ')

          expect(post_comments).to include(@comment)
        end
      end
    end
  end
end
