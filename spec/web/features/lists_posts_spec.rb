require 'features_helper'

RSpec.feature 'List posts' do
  let(:repository) { PostRepository.new }

  before do
    repository.clear

    repository.create(title: 'Post One', body: 'Post Body')
    repository.create(title: 'Post Two', body: 'Post Body')
  end

  scenario 'displays each post on the page' do
    visit '/posts'

    within '.posts' do
      expect(page).to have_css('.post', count: 2)
    end
  end
end
