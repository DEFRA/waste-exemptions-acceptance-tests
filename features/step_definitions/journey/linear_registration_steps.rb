# frozen_string_literal: true

Given("I enter the grid reference for the linear site") do
  @linear_site = true
  @world.journey.site_grid_reference_page.submit(grid_ref: create_grid_reference,
                                                 site_details: "Linear registration",
                                                 linear: true)
end
# rubocop:disable Layout/LineLength
Then("I will see an indication that the registration is for a linear exemption on the registration details page") do
  visit("#{Quke::Quke.config.custom['urls']['back_office']}/registrations/#{@world.last_reg_no}")
  expect(@world.bo.registration_details_page.heading.text).to have_text("Linear registration details for #{@world.last_reg_no}")
end

Then("I can view linear registration's details from the linear registrations list") do
  @world.bo.dashboard_page.admin_menu.linear_registrations.click
  @world.bo.linear_registrations_page.last_page.click if @world.bo.linear_registrations_page.has_last_page?
  @world.bo.linear_registrations_page.wait_until_first_view_registration_link_visible
  5.times do
    puts "Checking for linear registration #{@world.last_reg_no}"
    sleep 1
    break unless @world.bo.linear_registrations_page.linear_regs(@world.last_reg_no).nil?
  end
  @linear_registration = @world.bo.linear_registrations_page.linear_regs(@world.last_reg_no)
  5.times do
    sleep 1
    break if @linear_registration.view_registration["href"].include? @world.last_reg_no
  end
  puts @linear_registration.view_registration["href"]
  @linear_registration.view_registration.click
  @world.bo.registration_details_page.wait_until_sites_visible
  expect(@world.bo.registration_details_page.heading.text).to have_text("Linear registration details for #{@world.last_reg_no}")
end
# rubocop:enable Layout/LineLength
