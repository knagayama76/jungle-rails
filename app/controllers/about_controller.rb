class AboutController < ApplicationController
  def index
  end
end


# The owners have requested that we add an about page to the website.

# The page should be accessible via /about and it should be linked in the top nav as "About Us".

# The page can just contain static content that describes the store. Details about what goes into the content are unclear and unimportant for now. Feel free to get creative here.

# Tips
# Create a new controller called about_controller.rb (ideally using the rails generator)
# This new controller should have single action index to render this page. Use an ERB template to render the page
# Don't forget to update the top nav with a link to the page.
# Do not implement the internal link using a simple <a> tag. Mimic the way the other links are created in the nav
# Use bin/rake routes to figure out what the name of the route is