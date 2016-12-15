require 'features_helper'
require_relative '../../../../apps/web/views/posts/index'

RSpec.describe Web::Views::Posts::Index do
  let(:exposures) { Hash[posts: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #posts' do
    expect(view.posts).to eq exposures.fetch(:posts)
  end

  describe 'when there are no posts' do
    it 'shows a placeholder message' do
      expect(rendered).to include('There are no posts yet.')
    end
  end

  describe 'when there are posts' do
    let(:post1)     { Post.new(title: 'Post One', body: 'Post body') }
    let(:post2)     { Post.new(title: 'Post Two', body: 'Post Body') }
    let(:exposures) { Hash[posts: [post1, post2]] }

    it 'lists them all' do
      expect(rendered).to include 'Post One'
      expect(rendered).to include 'Post Two'
    end

    it 'does not display the placeholder message' do
      expect(rendered).not_to include 'There are no posts yet'
    end
  end
end
