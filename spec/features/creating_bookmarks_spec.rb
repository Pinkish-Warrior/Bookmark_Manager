# in spec/features/creating_bookmarks_spec.rb

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.example.org')
    click_button('Submit')
  
    expect(page).to have_content('http://www.example.org')
  end
end