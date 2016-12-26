require_relative '../../../../apps/web/controllers/posts/update'

RSpec.describe Web::Controllers::Posts::Update do
  let(:action)     { described_class.new }
  let(:repository) { PostRepository.new }
  let(:post)       { repository.create(title: 'Post One', body: 'Post Body') }
  let(:params)     { Hash[post:{ id: post.id, title: 'Post One Updated', body: 'Post Body Updated' }] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'updates a post' do
    expect(post.title).to eq 'Post One'
    expect(post.body).to eq 'Post Body'
    action.call(params)

    post_updated = PostRepository.new.find(post.id)

    expect(post_updated.title).to eq 'Post One Updated'
    expect(post_updated.body).to eq 'Post Body Updated'
  end
end
