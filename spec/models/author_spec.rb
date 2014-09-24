require 'rails_helper'

RSpec.describe Author, :type => :model do
  describe 'trending' do

    let!(:popular_author) { create(:author) }
    let!(:most_popular_author) { create(:author, name: 'Joe') }
    let!(:author) { create(:author, name: 'John') }
    let!(:most_popular_post) { create(:post, author: most_popular_author) }
    let!(:popular_post) { create(:post, author: popular_author) }
    let!(:post) { create(:post, author: author) }
    let!(:comment1) { create(:comment, post: most_popular_post) }
    let!(:comment2) { create(:comment, post: most_popular_post) }
    let!(:comment3) { create(:comment, post: popular_post) }
    let!(:comment4) { create(:comment, post: post, created_at: 8.days.ago) }
  
    it 'returns authors in order of most recent comments' do
      expect(Author.trending[0]).to eq(most_popular_author)
      expect(Author.trending[1]).to eq(popular_author)
    end

    it 'does not return an author with only a comment older than 7 days ago' do
      expect(Author.trending).not_to include(author)
    end
  end
end
