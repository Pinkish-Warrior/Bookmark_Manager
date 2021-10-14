# in spec/features/creating_bookmarks_spec.rb

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.example.org')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    
    # expect(page).to have_content 'http://www.example.org'
    expect(page).to have_link('Test Bookmark', href: 'http://example.org')
  end
end
