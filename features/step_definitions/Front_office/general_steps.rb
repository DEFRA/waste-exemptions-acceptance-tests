Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load

end

Given(/^I register a new exemption$/) do
  @app.what_do_you_want_to_do_page.submit_new
end

When(/^I complete a registration as an individual$/) do
  
	 # Contact details page
  @app.contact_details_page.submit(
    full_name: 'John Smith',
    tel_number: '01234567899',
	email: 'tim.stone.ea@gmail.com',
    confirm_email: 'tim.stone.ea@gmail.com'
  )


end