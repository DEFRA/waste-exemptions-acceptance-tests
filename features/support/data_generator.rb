# frozen_string_literal: true

require "faker"

def generate_registration(business_type, operator_name = nil)
  applicant = generate_person

  contact = if business_type == :limited
              generate_person
            else
              applicant
            end
  registration_number = business_type == :limited ? "00445790" : nil
  operator_name ||= generate_operator_name(business_type, "#{contact[:first_name]} #{contact[:last_name]}")

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
    telephone: "0117 9000000",
    email: generate_example_email(first_name, last_name),
    position: Faker::Job.title
  }
end

def generate_operator_name(business_type, operator_name)
  operator_name = "#{Faker::Company.unique.name} Ltd" if business_type == :limited
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
  @world.known_reg = generate_registration(:individual, "Mr Waste submitted")
  @world.known_reg_no = add_submitted_registration(@world.known_reg, true, "random", "random")

  unsubmitted_reg = generate_registration(:individual, "Mr Waste unsubmitted")
  add_unsubmitted_registration(unsubmitted_reg)

  # Get the first and last name of the last submitted and unsubmitted applicant
  known_first_name = @world.known_reg[:applicant][:first_name].to_s
  known_last_name = @world.known_reg[:applicant][:last_name].to_s
  @world.known_submitted_applicant = known_first_name + " " + known_last_name

  new_first_name = unsubmitted_reg[:applicant][:first_name].to_s
  new_last_name = unsubmitted_reg[:applicant][:last_name].to_s
  @world.known_transient_applicant = new_first_name + " " + new_last_name
end
