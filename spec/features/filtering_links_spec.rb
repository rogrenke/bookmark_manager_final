feature 'filtering links' do
  scenario 'see links tagged with "Bubbles"' do
    visit('links/new')
    fill_in 'title', with: 'Bubble Page'
    fill_in 'url', with: 'www.bubbles.com'
    fill_in 'tag_name', with: 'bubbles'
    click_button('Submit')
    visit('links/new')
    fill_in 'title', with: 'Rainbow Page'
    fill_in 'url', with: 'www.no-bubbles.com'
    fill_in 'tag_name', with: 'rainbows'
    click_button('Submit')
    visit '/tags/bubbles'
    expect(page).to have_content('Bubble Page')
    expect(page).to_not have_content('Rainbow Page')
  end
end
