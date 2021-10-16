# in spec/features/viewing_bookmarks_spec.rb
require 'pg'
require 'spec_helper'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'visiting the index page' do
    visit ('/bookmarks')
    expect(page).to have_content "http://makersacademy"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end

feature 'Viewing bookmarks' do
  scenario 'a user can see bookmarks' do
    #connection = PG.connect(dbname: 'bookmark_manager_test')
    
    Bookmark.create(url: 'www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'www.google.com', title: 'Google')
    
    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href:'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href:'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href:'http://www.google.com')

  end
end
