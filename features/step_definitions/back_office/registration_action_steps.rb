# frozen_string_literal: true

When("I view the registration details") do
  @world.bo.dashboard_page.view_link(@world.last_reg_no).click
end

When("I resend the renewal reminder letter") do
  @world.bo.registration_details_page.resend_renewal_letter(@world.last_reg_no).click
  # As same element is used on both pages a check to wait for the second page to load is needed
  expect(@world.bo.resend_letter_page.heading).to have_content("resend")
  @world.bo.resend_letter_page.resend_renewal_letter(@world.last_reg_no).click
end

When("I resend the confirmation letter") do
  @world.bo.registration_details_page.resend_confirmation_letter(@world.last_reg_no).click
  # As same element is used on both pages a check to wait for the second page to load is needed
  expect(@world.bo.resend_letter_page.heading).to have_content("resend")
  @world.bo.resend_letter_page.resend_confirmation_letter(@world.last_reg_no).click
end

When("I resend the confirmation email") do
  @world.bo.registration_details_page.resend_confirmation_email(@world.last_reg_no).click
end

When("I resend the renewal invite email") do
  @world.bo.registration_details_page.resend_confirmation_email(@world.last_reg_no).click
end

When("I open communication history") do
  @world.bo.registration_details_page.communication_history(@world.last_reg_no).click
end

Then("I will see a confirmation the renewal reminder letter has been sent") do
  expect(@world.bo.dashboard_page.dashboard_message).to have_text("Renewal letter sent to #{@world.last_reg_no}")
end

Then("I will see the registration confirmation letter has been sent") do
  expect(@world.bo.dashboard_page.dashboard_message).to have_text("Confirmation letter sent to #{@world.last_reg_no}")
end

Then("I will see the registration confirmation email has been sent") do
  expect(@world.bo.dashboard_page.dashboard_message).to have_text("Confirmation email sent to #{@contact_email}")

end

Then("I can see the communication logs on the communication history page") do
  expect(@world.bo.communication_history_page.heading).to have_text("Communication history")
  log = @world.bo.communication_history_page.log_details(@contact_email)
  expect(log.template_name).to have_text("Registration completion email")
end

When("I refresh the company name from companies house") do
  @company_name = @world.bo.registration_details_page.company_name.text
  @world.bo.registration_details_page.refresh_company_details.click
  @change_reason = "Companies House information refreshed"
end

Then("I will see a confirmation the company name has been refreshed") do
  expect(@world.bo.registration_details_page.company_name.text).not_to eq(@company_name)
  @updated_detail = @world.bo.registration_details_page.company_name.text
  expect(@world.bo.dashboard_page.dashboard_message).to have_text("refreshed the Companies House")
end

Then("I can see the change recorded on the change history page") do
  @world.bo.registration_details_page.change_history.click
  expect(@world.bo.change_history_page.heading).to have_text("Change history")
  log = @world.bo.change_history_page.change_reason(@change_reason)
  expected_text =  remove_new_lines_from_text(log.updated_detail.text)
  expect(expected_text).to have_text(@updated_detail)
end
