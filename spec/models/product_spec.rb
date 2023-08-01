require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @category = Category.new(name: "Green")
    @category.save
    # Create a product
    @product = Product.new(name: "Sample", price: 2000, quantity: 10, category: @category)
  end

  describe 'Validations' do
    it "Product should save when recieving correct values" do
      # Test if we can save it
      expect(@product.save).to be(true)
    end

    it "Product should not save when name is not given for product" do
      # Change Product name and save it
      @product.name = nil; 
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "Product should not save when price is not given for product" do
      # Change Product price and save it
      @product.price = nil; 
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages).to include("Price cents must be greater than 0")
    end

    it "Product should not save when quantity is not given for product" do
      # Change Product quantity and save it
      @product.quantity = nil; 
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "Product should not save when category is not given for product" do
      # Change Product category and save it
      @product.category = nil; 
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages).to include("Category must exist")
    end
  end
end
