# frozen_string_literal: true

Given("I have a registration outside of the renewal window") do
  login_user(@world.developer_user)
  #   Expiry window in test environment is set to three years so expiry date needs to be longer
  @four_years = DateTime.now.next_year(4).strftime("%Y-%m-%d")
  create_registration(@four_years)
  @registration = @world.bo.dashboard_page.created_registration.text[/(WEX\d+)/, 1]
  puts "#{@registration} generated"
end
