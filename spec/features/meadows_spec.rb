require "rails_helper"

RSpec.feature Meadow, type: :feature do
  scenario "Visit the index page" do
    create_list(:meadow, 10)

    visit root_path

    click_link 'Pratos'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 11)
    end

    expect(page).to have_button('Pesquisar')
    expect(page).to have_link('Cadastrar novo Prato')
  end

  scenario "Visit the index page and show only filtered" do
    create_list(:meadow, 10)
    create_list(:meadow, 10, name: 'Baz')

    visit root_path

    click_link 'Pratos'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 21)
    end

    expect(page).to have_button('Pesquisar')

    fill_in 'Nome', with: 'Baz'

    click_button 'Pesquisar'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 11)
      expect(page).to_not have_content('BarFoo')
    end
  end

  scenario "Create new meadow" do
    create(:restaurant)

    visit root_path

    click_link 'Pratos'

    click_link 'Cadastrar novo Prato'

    select 'FooBar', from: 'Restaurante'
    fill_in 'Nome', with: 'FooBaz'
    fill_in 'Preço', with: '10.0'

    click_button 'Salvar'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 2)
      expect(page).to have_content('FooBaz')
    end
  end

  scenario "Update a meadow" do
    meadow = create(:meadow)

    visit root_path

    click_link 'Pratos'

    within('table') do
      page.click_link('', href: "/meadows/#{meadow.id}/edit")
    end

    fill_in 'Nome', with: 'Baz'

    click_button 'Salvar'

    within('table') do
      expect(page).to have_xpath(".//tr", count: 2)
      expect(page).to have_content('Baz')
    end
  end

  scenario "Delete a meadow" do
    meadow = create(:meadow)

    visit root_path

    click_link 'Pratos'

    within('table') do
      page.click_link('', href: "/meadows/#{meadow.id}")
    end

    page.refresh

    expect(page).to have_xpath(".//tr", count: 1)
    expect(page).to_not have_content('FooBar')
  end
end
