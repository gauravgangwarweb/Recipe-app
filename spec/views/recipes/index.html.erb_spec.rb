require 'rails_helper'

RSpec.describe 'recipes/index', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preparation_time: '1 hour', user: @user)
    sign_in @user
    visit recipes_path
  end
  it 'renders a list of recipes' do
    expect(page).to have_content 'Recipe'
  end

  it 'click on new recipe' do
    click_on 'Add new recipe'
    sleep 1
    expect(current_path).to eql '/recipes/new'
  end

  it 'click on recipe' do
    find("a[href='/recipes/#{@recipe.id}']").click
    sleep 1
    expect(current_path).to eql recipe_path(@recipe)
  end
end
