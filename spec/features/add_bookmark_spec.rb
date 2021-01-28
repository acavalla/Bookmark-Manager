feature 'add bookmark' do
  scenario 'user can add a bookmark to the bookmark manager' do
    visit('/bookmarks/new')
    fill_in :bookmark, with: 'facebook.com'
    click_button("Add bookmark")
    expect(page).to have_content('facebook.com')
  end
end
