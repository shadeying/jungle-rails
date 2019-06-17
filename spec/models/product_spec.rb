require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before do
      @category = Category.new name: 'Weird Stuff'
      @product = Product.new(
                  name: 'Thanos Action Figure',
                  price: 50,
                  quantity: 20,
                  category: @category
                )
      @category.save!
      @product.save!
    end

    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end

end
