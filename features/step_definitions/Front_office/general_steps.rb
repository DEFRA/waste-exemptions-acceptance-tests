Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load

end

Given(/^I register a new exemption$/) do
  @app.registration_type_page.submit_new
end

