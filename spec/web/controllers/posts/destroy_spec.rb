require_relative '../../../../apps/web/controllers/posts/destroy'

RSpec.describe Web::Controllers::Posts::Destroy do
  let(:action)     { described_class.new }
  let(:repository) { PostRepository.new }
  let!(:post)      { repository.create(title: 'Post One', body: 'Post Body') }
  let(:params)     { Hash[post] }

  it 'deletes a post' do
    expect { action.call(params) }.to change { repository.all.count }.by(-1)
  end

  it 'redirects to the posts path once completed' do
    response = action.call(params)
    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/posts'
  end
end
