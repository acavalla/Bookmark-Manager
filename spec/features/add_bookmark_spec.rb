feature 'add bookmark' do
  scenario 'user can add a bookmark to the bookmark manager' do
    visit('/bookmarks/new')
    fill_in :bookmark, with: 'facebook.com'
    click_button("Add bookmark")
    expect(page).to have_content('www.facebook.com')
    expect(page).to have_content('Added bookmark!')
  end
end
