require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "Product should save when recieving correct values" do
      # Create a category and save it
      @category = Category.new(name: "Green")
      @category.save
      # Create a product
      @product = Product.new(name: "Sample", price_cents: 2000, quantity: 10, category: @category)
      # Test if we can save it
      expect(@product.save).to be(true)
    end

    it "Product should not save when name is not given for product" do
      # Create a category and save it
      @category = Category.new(name: "Green")
      @category.save
      # Create a product and save it
      @product = Product.new(name: nil, price_cents: 2000, quantity: 10, category: @category)
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it "Product should not save when price is not given for product" do
      # Create a category and save it
      @category = Category.new(name: "Green")
      @category.save
      # Create a product and save it
      @product = Product.new(name: "Sample", price_cents: nil, quantity: 10, category: @category)
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages[0]).to eql("Price cents is not a number")
    end

    it "Product should not save when quantity is not given for product" do
      # Create a category and save it
      @category = Category.new(name: "Green")
      @category.save
      # Create a product and save it
      @product = Product.new(name: "Sample", price: 20, quantity: nil, category: @category)
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
    end

    it "Product should not save when category is not given for product" do
      @product = Product.new(name: "Sample", price_cents: 2000, quantity: 20, category: nil)
      # Create a product and save it
      @product.save 
      # Check if we recieved the correct error message
      expect(@product.errors.full_messages[0]).to eql("Category must exist")
    end
  end
end
