# frozen_string_literal: true

When("I change the contact name previously entered") do
  @world.journey.check_details_page.change_contact_name.click
  @new_contact_name = generate_person("new_contact@example.com")
  @world.journey.contact_name_page.submit(first_name: @new_contact_name[:first_name],
                                                last_name: @new_contact_name[:last_name])
end

Then("I can see the contact name has been updated") do
  expect(@world.journey.check_details_page.contact_name.text).to eq(@new_contact_name[:full_name])
  expect(@world.journey.check_details_page.contact_name.text).not_to eq(@applicant[:full_name])
end
