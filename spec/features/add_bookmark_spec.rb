# frozen_string_literal: true

feature 'add bookmark' do
  scenario 'boxes are labelled' do
    visit '/bookmarks/new'
    expect(page).to have_content("Site")
    expect(page).to have_content("URL")
  end

  scenario 'user can add a bookmark to the bookmark manager' do
    visit('/bookmarks/new')
    fill_in :title, with: 'Facebook'
    fill_in :bookmark, with: 'facebook.com'
    click_button('Add bookmark')
    expect(page).to have_link('Facebook')
  end

  scenario 'URL will be prepended with http://www.' do
    visit('/bookmarks/new')
    fill_in :title, with: 'Facebook'
    fill_in :bookmark, with: 'facebook.com'
    click_button('Add bookmark')
    expect(page).to have_link('Facebook', href: 'http://facebook.com')
  end
end
