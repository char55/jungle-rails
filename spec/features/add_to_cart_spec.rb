require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "Click on the cart" do

    visit root_path
    click_on("Add", match: :first)

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_text 'My Cart (1)'

  end
end
