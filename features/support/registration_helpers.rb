# frozen_string_literal: true

def add_submitted_registration(registration, load_root_page = true)
  @world.journey.home_page.load if load_root_page

  @world.journey.registration_type_page.submit(start_option: :new_registration)
  @world.journey.location_page.submit(location: :england)

  complete_applicant_details(registration[:applicant])
  complete_organisation_details(registration)
  complete_contact_details(registration[:contact])
  complete_farm_questions(registration)

  @world.journey.site_grid_reference_page.submit(
    grid_ref: registration[:site][:grid_ref],
    site_details: registration[:site][:site_details]
  )

  @world.journey.choose_exemptions_page.submit(exemptions: registration[:exemptions])

  complete_confirmations
end

def add_unsubmitted_registration(registration, load_root_page = true)
  @world.journey.home_page.load if load_root_page

  @world.journey.registration_type_page.submit(start_option: :new_registration)
  @world.journey.location_page.submit(location: :england)

  complete_applicant_details(registration[:applicant])
  complete_organisation_details(registration)
end

def complete_applicant_details(person)
  @world.journey.applicant_name_page.submit(first_name: person[:first_name], last_name: person[:last_name])
  @world.journey.applicant_phone_page.submit(tel_number: person[:telephone])
  @world.journey.applicant_email_page.submit(email: person[:email], confirm_email: person[:email])
end

def complete_organisation_details(registration)
  @world.journey.business_type_page.submit(business_type: registration[:business_type])

  if registration[:business_type] == :limited
    @world.journey.registration_number_page.submit(
      registration_number: registration[:registration_number]
    )
  elsif registration[:business_type] == :partnership
    complete_partner_details(registration)
  end

  complete_operator_name_and_address(registration)
end

def complete_operator_name_and_address(registration)
  @world.journey.operator_name_page.submit(org_name: registration[:operator_name])
  @world.journey.operator_address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
end

def complete_partner_details(registration)
  @world.journey.partners_page.add_main_person(
    first_name: registration[:partners][0][:first_name],
    last_name: registration[:partners][0][:last_name]
  )
  @world.journey.partners_page.submit(
    first_name: registration[:partners][1][:first_name],
    last_name: registration[:partners][1][:last_name]
  )
end

def complete_contact_details(person)
  @world.journey.contact_name_page.submit(first_name: person[:first_name], last_name: person[:last_name])
  @world.journey.contact_position_page.submit(position: person[:position])
  @world.journey.contact_telephone_page.submit(tel_no: person[:telephone])
  @world.journey.contact_email_page.submit(email: person[:email], confirm_email: person[:email])
  @world.journey.contact_address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
end

def complete_farm_questions(registration)
  @world.journey.on_farm_page.submit(on_farm: registration[:on_farm])
  @world.journey.farmer_page.submit(farmer: registration[:farmer])
end

def complete_confirmations
  @world.journey.check_details_page.submit
  @world.journey.declaration_page.submit

  @world.journey.confirmation_page.ref_no.text
end
