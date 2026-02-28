# frozen_string_literal: true

Given("I enter my location for the site") do
  @world.journey.multiple_sites_question_page.submit(choice: :single)
  @world.journey.site_grid_reference_page.choose_address.click
  @postcode = "S70 5SZ"
  @address = "DUNKIN DONUTS, UNIT 1B, KESTREL WAY, BIRDWELL, BARNSLEY, S70 5SZ"
  @world.journey.address_lookup_page.submit(postcode: @postcode, result: @address)
end

When("I enter the registration details for site {string}") do |grid_ref|
  @world.journey.multiple_sites_question_page.submit(choice: :single)
  @world.journey.site_grid_reference_page.submit(
    grid_ref: grid_ref,
    site_details: "EA area lookup"
  )
end

Given("I confirm my exemption is for multiple sites") do
  @world.journey.multiple_sites_question_page.submit(choice: :multiple)
  @number_of_sites = 0
  @multiple_sites = true
end

Given(/^I enter the grid reference for (?:a|another) site$/) do
  @world.journey.multiple_sites_summary_page.add_site.click unless @number_of_sites.zero?
  @world.journey.site_grid_reference_page.submit(grid_ref: create_grid_reference,
                                                 site_details: "Site #{@number_of_sites + 1}")
  @number_of_sites += 1
end

Given("I enter the grid reference for another {int} sites") do |sites|
  sites.times do
    @world.journey.multiple_sites_summary_page.add_site.click
    @world.journey.site_grid_reference_page.submit(grid_ref: create_grid_reference,
                                                   site_details: "Site #{@number_of_sites + 1}")
    @number_of_sites += 1
  end
  puts current_url
end

When("I confirm I have added all my sites") do
  @world.journey.multiple_sites_summary_page.submit
end

Then("I am shown the multiple site registration charge summary") do
  expect(@world.journey.exemptions_summary_page).to have_total_charge
end

When("I delete a site") do
  @world.journey.multiple_sites_summary_page.delete_site.first.click
  @number_of_sites -= 1
end

Then("I cannot continue with my registration") do
  expect(@world.journey.multiple_sites_summary_page.submit_button).to be_disabled
end

Then("I can see the total number of sites on the check your answers page") do
  expect(@world.journey.check_details_page).to have_content("Number of sites: #{@number_of_sites}")
end
