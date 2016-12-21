Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load

end

Given(/^I register a new exemption$/) do
  @app.what_do_you_want_to_do_page.submit_new
end
