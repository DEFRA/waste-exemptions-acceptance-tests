# frozen_string_literal: true

require "faker"

def generate_registration(business_type, operator_name = nil)
  # Generate data to be used for a registration.
  # Input parameters:
  # - business type, defined in features/page_objects/journey/business_type_page
  # - a given operator name (default nil)

  applicant = generate_person

  contact = if business_type == :limited_company
              generate_person
            else
              applicant
            end

  # Syntax from https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Style/MultipleComparison
  # If the business type is :limited_company or :llp then set registration number.
  registration_number = %i[limited_company llp].include?(business_type) ? "00445790" : nil

  operator_name ||= generate_operator_name(business_type, "#{contact[:first_name]} #{contact[:last_name]}")

  # Return a hash containing the following data.
  # Some of the sub items are also hashes.
  # Retrieve using
  {
    business_type: business_type,
    applicant: applicant,
    contact: contact,
    operator_name: operator_name,
    registration_number: registration_number,
    partners: generate_partners(business_type),
    site: generate_site,
    on_farm: true,
    farmer: true,
    exemptions: %w[U2 U12 T6 T19 T25 T31 S1]
  }
end

def generate_person
  first_name ||= Faker::Name.unique.first_name
  last_name ||= Faker::Name.unique.last_name

  {
    first_name: first_name,
    last_name: last_name,
    full_name: first_name + " " + last_name,
    telephone: "0117 9000000",
    email: generate_example_email(first_name, last_name),
    position: Faker::Job.title
  }
end

def generate_operator_name(business_type, operator_name)
  operator_name = "#{Faker::Company.unique.name} Ltd" if business_type == :limited_company
  operator_name
end

def generate_partners(business_type)
  return [generate_person, generate_person] if business_type == :partnership

  []
end

def generate_site
  {
    grid_ref: "SE 09287 25320",
    site_details: "Up north"
  }
end

def prepopulate_registrations
  # This creates a submitted and unsubmitted registration and stores the data in global variables.
  # It is used before tests where a @data tag exists.
  # Registrations are also generated in the "I register an exemption" step, which stores data in a different variable.
  # Consider reorganising tests so as not to duplicate with the above step.

  # This is a hash containing the data:
  @world.known_reg = generate_registration(:individual, "Mr Waste submitted")

  # This completes the registration and stores the registration number:
  @world.known_reg_no = add_submitted_registration(@world.known_reg, true, "random", "random")

  # This does the same steps for an incomplete registration:
  unsubmitted_reg = generate_registration(:individual, "Mr Waste unsubmitted")
  add_unsubmitted_registration(unsubmitted_reg)

  # Get the full name of the last submitted and unsubmitted applicant:
  @world.known_submitted_applicant = @world.known_reg[:applicant_name].to_s
  @world.known_transient_applicant = unsubmitted_reg[:applicant_name].to_s
end
