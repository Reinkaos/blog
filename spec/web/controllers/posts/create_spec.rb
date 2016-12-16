require_relative '../../../../apps/web/controllers/posts/create'

RSpec.describe Web::Controllers::Posts::Create do
  let(:action) { Web::Controllers::Posts::Create.new }
  let(:params) { Hash[post: { title: 'Post One', body: 'Post Body' }] }

  before do
    PostRepository.new.clear
  end

  it 'creates a new post' do
    action.call(params)

    expect(action.post.id).not_to be nil
    expect(action.post.title).to eq params[:post][:title]
  end

  it 'redirects the user to the posts listing' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/posts'
  end
end
