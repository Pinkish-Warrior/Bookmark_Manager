# in spec/features/updating_a_bookmark_spec.rb

feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'https://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'https://www.makersacademy.com')
  
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
  
    fill_in('url', with: "https://www.snakersacademy.com")
    fill_in('title', with: "Snakers Academy")
    click_button('Submit')
  
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('0')
    expect(page).to have_link('Snakers Academy', href: 'https://www.snakersacademy.com')
  end
end
  