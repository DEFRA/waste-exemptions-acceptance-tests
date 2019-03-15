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
    exemptions: %w[S1]
  }
end

def generate_person
  first_name ||= Faker::Name.first_name
  last_name ||= Faker::Name.last_name

  {
    first_name: first_name,
    last_name: last_name,
    telephone: "0117 9000000",
    email: generate_example_email(first_name, last_name),
    position: Faker::Job.title
  }
end

def generate_operator_name(business_type, operator_name)
  operator_name = "#{Faker::Company.name} Ltd" if business_type == :limited
  operator_name
end

def generate_partners(business_type)
  return [generate_person, generate_person] if business_type == :partnership

  []
end

def generate_site
  {
    grid_ref: "ST 58132 72695",
    site_details: "Yer it is"
  }
end

def prepopulate_registrations
  @world.known_reg = generate_registration(:individual, "Mr Waste submitted")
  @world.known_reg_no = add_submitted_registration(@world.known_reg)

  unsubmitted_reg = generate_registration(:individual, "Mr Waste unsubmitted")
  add_unsubmitted_registration(unsubmitted_reg)
end
