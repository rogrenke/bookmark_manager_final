feature 'password confirmation' do
  scenario 'user confirms password incorrectly' do
    visit('/sign_up')
    fill_in 'email', with: 'sam@makers.com'
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '5678'
    click_button('submit')
    expect(User.count).to eq 0
    expect(current_path).to eq("/sign_up")
    expect(page).to have_content("Password and confirmation password do not match")
  end
end
