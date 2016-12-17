require_relative '../../../../apps/web/views/posts/show'

RSpec.describe Web::Views::Posts::Show do
  let(:exposures) { Hash[post: nil] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/show.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #post' do
    expect(view.post).to eq exposures.fetch(:post)
  end

  describe 'when a post was not found' do
    it 'shows a friendly message' do
      expect(rendered).to include('Sorry, the post that you are looking for is not here.')
    end
  end

  describe 'when a post is found' do
    let(:post)     { Post.new(title: 'Post One', body: 'Post Body') }
    let(:exposures) { Hash[post: post] }

    it 'shows the post' do
      expect(view.post).to eq exposures.fetch(:post)
      expect(rendered).to include 'Post One'
    end

    it 'does not display the friendly message' do
      expect(rendered).not_to include('Sorry, the post that you are looking for is not here.')
    end
  end
end
