# frozen_string_literal: true

When("I extend the registration's exemption expiry date") do
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.set_new_expiry_date.click
  @change_reason = "Extended registration exemptions for 1 year"
  @new_date = DateTime.now.next_year(4)
  @updated_detail = @new_date.strftime("%Y-%m-%d")
  @world.bo.extend_expiry_date_page.submit(day: @new_date.strftime("%d"),
                                           month: @new_date.strftime("%m"),
                                           year: @new_date.strftime("%Y"),
                                           reason: @change_reason)
end
# rubocop:disable Layout/LineLength
Then("I can see the exemption expiry date has extended") do
  expect(@world.bo.registration_details_page.exemption_details.first.expiry_date.text).to eq(@new_date.strftime("%d %B %Y"))
end
# rubocop:enable Layout/LineLength
