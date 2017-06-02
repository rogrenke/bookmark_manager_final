feature 'password confirmation' do
  scenario 'user confirms password correctly' do
    visit('/sign_up')
    fill_in 'email', with: 'sam@makers.com'
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '5678'
    click_button('submit')
    expect(User.count).to eq 0
  end
end
