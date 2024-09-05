# frozen_string_literal: true

# Functions that can be reused to help with payments

def submit_card_payment
  @world.journey.payment_page.submit(
    card_number: "4444333322221111",
    cardholder_name: "Mr Happy",
    expiry_month: "12",
    expiry_year: next_year,
    security_code: "555",
    email: "simulate-delivered@notifications.service.gov.uk"
  )
  # MOTO payments don't require an address
  unless @app == :bo
    @world.journey.payment_page.submit(
      address_line_one: "1 payment lane",
      address_line_two: "Teston",
      city: "Testville",
      postcode: "TS11 9XX"
    )
  end
  @world.journey.payment_page.submit_payment_button.click
  @world.journey.payment_confirmation_page.submit
end

def submit_invalid_card_payment
  @world.journey.payment_page.submit(
    card_number: "4000000000000002",
    cardholder_name: "Mr Sad",
    expiry_month: "12",
    expiry_year: next_year,
    security_code: "555",
    email: "simulate-delivered@notifications.service.gov.uk"
  )
  # MOTO payments don't require an address
  unless @app == :bo
    @world.journey.payment_page.submit(
      address_line_one: "1 payment lane",
      address_line_two: "Teston",
      city: "Testville",
      postcode: "TS11 9XX"
    )
  end
  @world.journey.payment_page.submit_payment_button.click
end
