require 'rails_helper'

RSpec.describe 'The page index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Hassan', email: 'hassan@example.com', password: '123456', confirmed_at: Time.now)
      @food1 = Food.create!(name: 'Appel', measurement_unit: 'kg', quantity: 5, price: 4, user_id: @user1.id)

      visit user_session_path
      fill_in 'Email', with: 'hassan@example.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit new_food_path
    end

    it 'should display a form with a name field' do
      expect(page).to have_field('Name')
    end

    it 'should display a form with a Measurement unit field' do
      expect(page).to have_field('Measurement unit')
    end

    it 'should display a form with a price field' do
      expect(page).to have_field('Price')
    end

    it 'should display a form with a submit button' do
      expect(page).to have_button('Create Food')
    end
  end
end
