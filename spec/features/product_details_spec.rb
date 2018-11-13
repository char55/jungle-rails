require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  'shirt',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visit a single products page" do
    # ACT
    visit root_path
    click_on('Details', match: :first)

    # DEBUG / VERIFY
    # puts page.html
    save_screenshot
    expect(page).to have_css '.products-show'
    save_screenshot
  end

end
