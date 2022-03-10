class Admin::DashboardController < Admin::BaseController
  def show
    @products_total = Product.count
    @categories_total = Category.count
  end


end

