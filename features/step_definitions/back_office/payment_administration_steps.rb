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
    payment_day: Time.now.day,
    payment_month: Time.now.month,
    payment_year: Time.now.year,
    payment_ref: "bacs123",
    payment_comment: "This is a comment"
  )
end

Given("I record a bank transfer payment for more than the registration amount") do
  @world.bo.payment_details_page.record_payment.click
  @overpayment_amount = 100
  @payment_amount = @total_charge.to_f + @overpayment_amount
  @world.bo.record_payment_page.submit(
    payment_type: :bacs,
    amount: @payment_amount,
    payment_day: Time.now.day,
    payment_month: Time.now.month,
    payment_year: Time.now.year,
    payment_ref: "bacs123",
    payment_comment: "This is a comment"
  )
end

Then("the balance will be zero") do
  expect(@world.bo.payment_details_page.balance.text).to eq("£0.00")
end

When("I record a refund of the overpayment") do
  @world.bo.payment_details_page.record_refund.click
  @world.bo.record_refund_page.record_refund.first.click
  @world.bo.record_refund_page.submit(amount: @overpayment_amount,
                                      reason: "Refund of overpayment")
end
