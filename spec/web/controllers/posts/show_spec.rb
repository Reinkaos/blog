require_relative '../../../../apps/web/controllers/posts/show'

RSpec.describe Web::Controllers::Posts::Show do
  let(:action)     { described_class.new }
  let(:repository) { PostRepository.new }
  let(:post)       { repository.create(title: 'Post One', body: 'Post Body') }
  let(:params)     { Hash[post] }

  before do
    repository.clear
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes the correct @post' do
    action.call(params)
    expect(action.exposures[:post]).to eq post
  end
end
