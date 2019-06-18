require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: 'Boring random white long-sleeves shirt',
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see product details when product title clicked" do
    # ACT
    visit root_path
    click_on 'Boring random white long-sleeves shirt'

    #VERIFY
    expect(page).to have_css 'article.product-detail'

    # DEBUG
    # save_screenshot
  end

  scenario "They see product details when details button clicked" do
    # ACT
    visit root_path
    click_on 'Details »'

    #VERIFY
    expect(page).to have_css 'article.product-detail'

    # DEBUG
    # save_screenshot
  end

end