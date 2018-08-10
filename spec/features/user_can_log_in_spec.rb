# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Sign_in', type: :feature do
  scenario 'Can Login after being signed up with correct email and password' do
    sign_up_new_user
    expect(page).to have_content('Welcome')
    click_link 'Log out'
    visit 'sign_in'
    expect(page).to have_content('Log in')
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'hello1'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully. Welcome to Ruffbook, test')
  end
  scenario 'Cannot Login without correct email' do
    sign_up_new_user
    expect(page).to have_content('Welcome')
    click_link 'Log out'
    visit 'sign_in'
    expect(page).to have_content('Log in')
    fill_in 'user_email', with: 'wrongemail@test.com'
    fill_in 'user_password', with: 'hello1'
    click_button 'Log in'
    expect(page).not_to have_content('Signed in successfully. Welcome to Ruffbook, test')
  end
  scenario 'Cannot Login without correct password' do
    sign_up_new_user
    expect(page).to have_content('Welcome')
    click_link 'Log out'
    visit 'sign_in'
    expect(page).to have_content('Log in')
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'wrongpassword'
    click_button 'Log in'
    expect(page).not_to have_content('Signed in successfully. Welcome to Ruffbook, test')
  end
  scenario 'Redirect to sign_in page if not signed in' do
    visit '/posts'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
