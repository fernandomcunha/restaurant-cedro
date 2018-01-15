require "rails_helper"

RSpec.feature "Home", type: :feature do
  scenario "Visit the root page" do
    visit root_path

    expect(page).to have_link('Restaurantes')
    expect(page).to have_link('Pratos')
    expect(page).to have_css('img', count: 1)
    expect(page).to have_text("SISTEMA DE CADASTRO DE RESTAURANTES")
  end
end
