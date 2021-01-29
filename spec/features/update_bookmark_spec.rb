# frozen_string_literal: true

feature 'update bookmark' do
    scenario 'user can update a bookmark in the bookmark manager' do
       bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
       visit('/bookmarks')
       first('.bookmark').click_button 'Update'
       expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
       fill_in('url', with: "http://www.snakersacademy.com")
       fill_in('title', with: "Snakers Academy")
       click_button("Submit")

      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
    end
  end