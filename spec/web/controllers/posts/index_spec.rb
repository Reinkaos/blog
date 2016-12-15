require_relative '../../../../apps/web/controllers/posts/index'

RSpec.describe Web::Controllers::Posts::Index do
  let(:action)     { described_class.new }
  let(:params)     { Hash[] }
  let(:repository) { PostRepository.new }

  before do
    repository.clear

    @post = repository.create(title: 'Post One', body: 'Post Body')
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all of the posts' do
    action.call(params)
    expect(action.exposures[:posts]).to eq [@post]
  end
end
