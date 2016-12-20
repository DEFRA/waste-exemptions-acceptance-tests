Given(/^I am an external user$/) do

 @app = App.new
 @app.front_office_home_page.load

end