# frozen_string_literal: true

Given("I have a registration {string} of the renewal window") do |window|
  login_user(@world.developer_user)
  # clears out persisted registration 
  @world.last_reg = nil unless @world.last_reg.nil?
  @years = if window == "outside"
             #   Expiry window in test environment is set to three years so expiry date needs to be longer
             DateTime.now.next_year(4).strftime("%Y-%m-%d")
           else
             DateTime.now.next_year(2).strftime("%Y-%m-%d")
           end
  create_registration(@years)
  @registration = @world.bo.dashboard_page.created_registration.text[/(WEX\d+)/, 1]
  @business_type = :limited_company
  puts "#{@registration} generated"
  @world.last_reg_no = @registration
end
