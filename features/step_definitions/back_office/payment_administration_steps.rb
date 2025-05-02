# frozen_string_literal: true

Given("I find the payment details for the registration") do
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  @world.bo.dashboard_page.view_link(@world.last_reg_no).click
  @world.bo.registration_details_page.payment_details.click
  @total_charge = remove_pound_and_minus_sign(@world.bo.payment_details_page.balance.text)
end

When("I record a bank transfer payment for the registration amount") do
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

When("I record a partial refund of half of the overpayment") do
  @world.bo.payment_details_page.record_refund.click
  @world.bo.record_refund_page.record_refund.first.click
  @world.bo.record_refund_page.submit(amount: half_amount(@overpayment_amount),
                                      reason: "Partial refund of overpayment")
end

When("I reverse the payment") do
  @world.bo.payment_details_page.reverse_payment.click
  @world.bo.record_reversal_page.reverse_payment.click
  @world.bo.record_reversal_page.submit(reason: "mistake")
end

Then("the total charge amount is owed") do
  expect(@world.bo.payment_details_page.balance.text).to eq("-£#{@total_charge}")
end

When("I add a positive charge of £{float} to the registration") do |charge|
  @world.bo.payment_details_page.adjust_charge.click
  @world.bo.charge_adjustment_type_page.decrease_charge.click
  @world.bo.charge_adjustment_type_page.submit_button.click
  @world.bo.charge_adjustment_page.submit(amount: charge,
                                          reason: "credit for refund")
end

When("I add a positive charge of the full registration amount") do
  @world.bo.payment_details_page.adjust_charge.click
  @world.bo.charge_adjustment_type_page.decrease_charge.click
  @world.bo.charge_adjustment_type_page.submit_button.click
  @world.bo.charge_adjustment_page.submit(amount: @total_charge,
                                          reason: "No charge registration")
end

Then("I can see the registration is £{float} in credit") do |amount|
  expect(@world.bo.payment_details_page.balance.text).to have_text("£#{amount}")
  expect(@world.bo.payment_details_page.balance.text).not_to have_text("-")
end
