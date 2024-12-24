# frozen_string_literal: true

When("I pay by card") do
  @world.journey.payment_summary_page.submit(payment_type: :card)
  submit_card_payment
end

When("I have my credit card payment rejected") do
  @world.journey.payment_summary_page.submit(payment_type: :card)
  submit_invalid_card_payment
  @world.journey.payment_confirmation_page.wait_until_return_visible
  expect(@world.journey.payment_summary_page).to have_text("Your payment has been declined")
  @world.journey.payment_confirmation_page.return.click
  puts current_url
end

When("I choose to pay by bank transfer") do
  @world.journey.payment_summary_page.submit(payment_type: :bank)
end

Then("I will see a registration pending payment confirmation") do
  expect(@world.journey.registration_confirmation_page.heading.text).to have_text("WEX")
  @registration = @world.journey.registration_received_pending_payment_page.registration_number.text
  puts "#{@registration} generated"
end
