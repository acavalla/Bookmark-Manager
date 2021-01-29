# frozen_string_literal: true

feature 'delete bookmark' do
  scenario 'user can delete a bookmark from the bookmark manager' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    visit('/bookmarks')

    fill_in :del_title, with: 'Github'
    click_button('Delete bookmark')
    expect(page).not_to have_content('Github')
  end
end
