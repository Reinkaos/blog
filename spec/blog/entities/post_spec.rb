RSpec.describe Post do
  describe 'attributes' do
    it 'can be initialized with a title' do
      post = Post.new(title: 'Post One')
      expect(post.title).to eq 'Post One'
    end

    it 'can be initialized with a body' do
      post = Post.new(body: 'Post Body')
      expect(post.body).to eq 'Post Body'
    end
  end
end
