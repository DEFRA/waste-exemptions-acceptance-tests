def generate_email
  @email_address = rand(100_000_000).to_s + "@mailinator.com"
end
