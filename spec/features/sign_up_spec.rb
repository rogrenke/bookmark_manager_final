feature 'sign up' do
  scenario 'user signs up with email address and password' do
    visit('/sign_up')
    fill_in 'email', with: 'sam@makers.com'
    fill_in 'password', with: '1234'
    click_button('submit')
    expect(page).to have_content "Links"
    expect(page).to have_content "Welcome sam@makers.com, we are happy to see you!"
    expect(User.count).to eq 1
  end
end
