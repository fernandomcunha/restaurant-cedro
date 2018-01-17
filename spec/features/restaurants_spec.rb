require "rails_helper"

RSpec.feature Restaurant, type: :feature do
  scenario "Visit the index page" do
    create_list(:restaurant, 10)

    visit root_path

    click_link 'Restaurantes'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 11)
    end

    expect(page).to have_button('Pesquisar')
    expect(page).to have_link('Cadastrar novo Restaurante')
  end

  scenario "Create new restaurant" do
    visit root_path

    click_link 'Restaurantes'

    click_link 'Cadastrar novo Restaurante'

    fill_in 'Nome', with: 'FooBar'

    click_button 'Salvar'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 2)
      expect(page).to have_content('FooBar')
    end
  end

  scenario "Update a restaurant" do
    restaurant = create(:restaurant)

    visit root_path

    click_link 'Restaurantes'

    within('table') do
      page.click_link('', href: "/restaurants/#{restaurant.id}/edit")
    end

    fill_in 'Nome', with: 'Baz'

    click_button 'Salvar'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 2)
      expect(page).to have_content('Baz')
    end
  end

  scenario "Delete a restaurant" do
    restaurant = create(:restaurant)

    visit root_path

    click_link 'Restaurantes'

    within('table') do
      page.click_link('', href: "/restaurants/#{restaurant.id}")
    end

    page.refresh

    expect(page).to have_xpath(".//tr", count: 1)
    expect(page).to_not have_content('FooBar')
  end
end
