class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def show
    @products_total = Product.count
    @categories_total = Category.count
  end


end


# users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)

# Display a count of how many products are in the database
# Display a count of how many categories are in the database

# Tips
# We could use AR models to query the database directly from the ERB views. However a better, more MVC approach to this is to let the controller fetch the data and pass it to the template. In other words, set instance variables in the controller action with values, and then render those instance variables in the ERB template