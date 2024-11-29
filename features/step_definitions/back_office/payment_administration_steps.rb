# frozen_string_literal: true

Given("I find the payment details for the registration") do
  @world.bo.dashboard_page.submit(search_term: @registration)
  @world.bo.dashboard_page.view_link(@registration).click
  @world.bo.registration_details_page.payment_details.click
end

When("I record a bank transfer payment for the registraton amount") do
  @world.bo.payment_details_page.record_payment.click
  @world.bo.record_payment_page.submit(
    payment_type: :bacs,
    amount: @total_charge,
    payment_day: "1",
    payment_month: "1",
    payment_year: "2023",
    payment_ref: "bacs123",
    payment_comment: "This is a comment"
  )
end

Then("the balance will be zero") do
  expect(@world.bo.payment_details_page.amount.text).to eq("£0.00")
end
