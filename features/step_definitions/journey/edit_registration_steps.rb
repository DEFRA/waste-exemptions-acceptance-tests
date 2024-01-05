# frozen_string_literal: true

Given "I have a valid registration" do
  login_user(@world.developer_user)
  create_registration(Date.today + 365)
  @registration = @world.bo.dashboard_page.created_registration.text[/(WEX\d+)/, 1]
  @edit_token = @world.bo.dashboard_page.created_registration.text[/Edit token: (.+)/, 1]
  puts "generated #{@registration}"
  @world.last_reg_no = @registration
  @world.last_reg_edit_token = @edit_token
  @contact_email = "contact1@example.com"
end

When "I click on an invalid edit link" do
  visit "/edit_registration/foo"
end

Then "I will see the invalid link page" do
  expect(@world.journey.confirmation_page).to have_text("This link is not valid")
end

When "I click on a valid edit link" do
  visit "/edit_registration/#{@world.last_reg_edit_token}"
end

When "I choose to make no changes" do
  @world.journey.front_office_edit_page.submit
end

When "I choose to change the contact email" do
  @world.journey.front_office_edit_page.change_contact_email_link.click
  expect(@world.journey.contact_email_page.title).to have_text("What's their email address?")
end

When "I submit the contact email form" do
  @contact_email = "new_email@wex.com"
  @world.journey.contact_email_page.submit(contact_email: @contact_email, confirmed_email: @contact_email)
end

Then "I will see the main edit page with the updated contact email" do
  expect(@world.journey.front_office_edit_page).to have_text("new_email@wex.com")
end

When "I choose to change the contact name" do
  @world.journey.front_office_edit_page.change_contact_name_link.click
  expect(@world.journey.contact_name_page.title)
    .to have_text("Who should we contact about this waste exemption operation?")
end

When "I submit the contact name form" do
  @world.journey.contact_name_page.submit(first_name: "Dexy", last_name: "Runner")
end

Then "I will see the main edit page with the updated contact name" do
  expect(@world.journey.front_office_edit_page).to have_text("Dexy Runner")
end

When "I choose to change the contact phone number" do
  @world.journey.front_office_edit_page.change_contact_phone_link.click
  expect(@world.journey.contact_phone_page.title).to have_text("What's their telephone number?")
end

When "I submit the contact phone number form" do
  @world.journey.contact_phone_page.submit(contact_phone: "0117 9876543")
end

Then "I will see the main edit page with the updated contact phone number" do
  expect(@world.journey.front_office_edit_page).to have_text("0117 9876543")
end

When "I choose to edit my exemptions" do
  @world.journey.front_office_edit_page.change_exemptions_link.click
  expect(@world.journey.choose_exemptions_page.title).to have_text("Untick any exemptions that are no longer needed")
end

When "I confirm my exemption changes" do
  expect(@world.journey.confirm_edit_exemptions_page.heading).to have_text("remove these exemptions?")
  @world.journey.confirm_edit_exemptions_page.submit(deregister: :accept)
end

When "I confirm full deregistration" do
  expect(@world.journey.confirm_edit_exemptions_page.heading)
    .to have_text("Are you sure you want to deregister all of these exemptions")
  @world.journey.confirm_edit_exemptions_page.submit(deregister: :accept)
end

Then "I will see the main edit page with the updated list of exemptions" do
  expect(@world.journey.front_office_edit_page).to have_text("U2, U3")
  expect(@world.journey.front_office_edit_page).not_to have_text("U1, U2")
end

Then "I will see the main edit page with an empty list of exemptions" do
  expect(@world.journey.front_office_edit_page).not_to have_text("U1")
  expect(@world.journey.front_office_edit_page).not_to have_text("U2")
  expect(@world.journey.front_office_edit_page).not_to have_text("U3")
end

When "I click to continue" do
  @world.journey.front_office_edit_page.submit
end

Then "I will see the declaration page" do
  expect(@world.journey.declaration_page).to have_text("Declaration")
  expect(@world.journey.declaration_page).to have_text("I confirm that")
end

When "I submit the declaration form" do
  @world.journey.front_office_edit_declaration_page.submit
end

Then "I will see the edit complete page" do
  expect(@world.journey.front_office_edit_complete_page)
    .to have_text("You have successfully updated your registration details")
end

Then "I will see the deregistration confirmation page" do
  expect(@world.journey.front_office_edit_complete_page)
    .to have_text("Your registration is now inactive and will be removed from the public register")
end

Then "I will not receive a confirmation email" do
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  confirmation_text = ["Registration edit complete"]
  expect(@world.journey.last_message_page).not_to have_text(confirmation_text)
  expect(@world.journey.last_message_page).not_to have_text(@registration)
end

Then "I will receive a confirmation email" do
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  confirmation_text = "Registration edit complete"
  expect(@world.journey.last_message_page).to have_text(confirmation_text)
  expect(@world.journey.last_message_page).to have_text(@contact_email)
  expect(@world.journey.last_message_page).to have_text(@registration)
end

Then "I will see the main edit page" do
  expect(@world.journey.front_office_edit_page).to have_text("You can update some of your registration details")

end
