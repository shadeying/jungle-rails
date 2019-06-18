require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create! name: 'Animals'
      @product1 = @category.products.create!(
        name: 'Cute little capybara',
        description: 'Capybara, (Hydrochoerus hydrochaeris), also called carpincho or water hog, the largest living rodent, a semiaquatic mammal of Central and South America. The capybara is the sole member of the family Hydrochoeridae. It resembles the cavy and guinea pig of the family Caviidae.',
        image: open_asset('capybara.png'),
        quantity: 10,
        price: 159.30
        )
      @product2 = @category.products.create!(
        name: 'Cute husky puppy',
        description: 'Two puppies are playing with an inflatable ball. It’s clear that one of them just tried to jump on the ball as he is on his side but still has one foot resting on the toy. He probably jumped on the ball and then, PUPRISE! he was on the ground. The other one hasn’t seemed to notice and is still charging for the ball, pawsibly to make the same mistake.',
        image: open_asset('puppy.jpg'),
        quantity: 20,
        price: 247.30
        )
      @category.save!
      @product1.save!
      @product2.save!
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'ironman@gmail.com',
        total_cents: 72520,
        stripe_charge_id: 'ch_1EmcUXI7H0fCknG6wM4EBrs2'
      )
      # 2. build line items on @order
      @item1 = LineItem.new(
        order: @order,
        product: @product1,
        quantity: 3
      )
      @item2 = LineItem.new(
        order: @order,
        product: @product2,
        quantity: 1
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(7)
      expect(@product2.quantity).to eql(19)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(
        email: 'ironman@gmail.com',
        total_cents: 31860,
        stripe_charge_id: 'ch_1EmcUXI7H0fCknG6wM4EBrs2'
      )
      # 2. build line items on @order
      @item1 = LineItem.new(
        order: @order,
        product: @product1,
        quantity: 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(8)
      expect(@product2.quantity).to eql(20)
    end
  end
end
