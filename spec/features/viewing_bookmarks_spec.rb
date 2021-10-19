# in spec/features/viewing_bookmarks_spec.rb
require 'pg'
require 'spec_helper'

feature 'Viewing bookmarks' do
  scenario 'in the index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'bookmarks are visible' do
    #connection = PG.connect(dbname: 'bookmark_manager_test')
    
    Bookmark.create(url: 'https://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'https://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'https://www.google.com', title: 'Google')
    
    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'https://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'https://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'https://www.google.com')

  end
end
