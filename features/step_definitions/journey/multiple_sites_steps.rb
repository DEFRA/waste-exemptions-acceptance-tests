# frozen_string_literal: true

Given("I confirm my exemption is for a single site") do
  @world.journey.multiple_sites_question_page.submit(choice: :single)
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

Then("I am informed of how many more sites I need to add to complete my registration") do
  expect(@world.journey.multiple_sites_summary_page).to have_content("#{30 - @number_of_sites} more site")
end

Then("I am shown the multiple site registration charge summary") do
  @world.journey.multiple_sites_summary_page.submit
  expect(@world.journey.exemptions_summary_page).to have_total_charge
end

When("I delete a site") do
  @world.journey.multiple_sites_summary_page.delete_site.first.click
  @number_of_sites -= 1
end

Then("I cannot continue with my registration") do
  expect(@world.journey.multiple_sites_summary_page.submit_button).to be_disabled
end
