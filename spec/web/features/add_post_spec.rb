require 'features_helper'

RSpec.feature 'Add a post' do
  after do
    PostRepository.new.clear
  end

  it 'can create a new post' do
    visit '/posts/new'

    within 'form#post-form' do
      fill_in 'Title', with: 'Post One'
      fill_in 'Body',  with: 'Post Body'

      click_button 'Create Post'
    end

    expect(current_path).to eq '/posts'
    expect(page).to have_content('Post One')
  end
end
