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
