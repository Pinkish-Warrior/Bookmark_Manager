feature 'visiting the homepage' do
  scenario 'the basic smoke test passes' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end
end

