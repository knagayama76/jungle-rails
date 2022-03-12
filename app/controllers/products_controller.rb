class ProductsController < ApplicationController

  before_filter :authorize

  def cool
  end

  def free
  end

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
