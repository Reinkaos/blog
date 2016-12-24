require_relative '../../../../apps/web/controllers/posts/destroy'

RSpec.describe Web::Controllers::Posts::Destroy do
  let(:action)     { described_class.new }
  let(:repository) { PostRepository.new }
  let!(:post)      { repository.create(title: 'Post One', body: 'Post Body') }
  let(:params)     { Hash[post] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'deletes a post' do
    expect { action.call(params) }.to change { repository.all.count }.by(-1)
  end
end
