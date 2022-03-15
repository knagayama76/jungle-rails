require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do


    it "is valid with valid attributes" do
      @product = Product.new
      @product.valid?
      expect(@product.errors).not_to be_nil
    end

    it "is not valid without a name" do
      @product = Product.new
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")
    end
    
    it "id not valid without a price" do
      @product = Product.new
      @product.price = nil
      @product.valid?
      expect(@product.errors[:price]).to include()
    end

    it "is not valid without a quantity" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include()
    end

    it "is not valid without a category" do
      @product = Product.new
      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end 
end


# Tips (read first!)
# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above