
# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class App
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  def what_do_you_want_to_do_page
  	@last_page = WhatDoYouWantToDoPage.new
  end

end
