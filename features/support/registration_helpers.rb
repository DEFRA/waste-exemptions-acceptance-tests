# frozen_string_literal: true

def add_submitted_registration(registration, load_root_page = true, address_type = "lookup", site_type = "random")
  # This function completes a full registration with parameters:
  # - a full set of `registration` data - generated from the generate_registration function in data_generator
  # - an option to load the root page or not (default true)
  # - an address type, for the applicant and contact addresses, of:
  #     lookup - looks up a postcode for the applicant and contact addresses (default)
  #     manual - enters addresses manually
  #     random - chooses a method at random
  # - a site type entered as a `grid_ref`, an `address`, or a `random` choice of either

  @world.journey.home_page.load if load_root_page
  @world.journey.registration_type_page.submit(start_option: :new_radio)
  @world.journey.location_page.submit(location: :england)
  @world.journey.choose_exemptions_page.submit(exemptions: registration[:exemptions])

  complete_applicant_details(registration[:applicant])
  complete_organisation_details(registration, address_type)
  complete_contact_details(registration[:contact], address_type)
  complete_farm_questions(registration)
  complete_site_details(registration, address_type, site_type)

  ref_no = complete_confirmations
  puts ref_no + " completed by " + registration[:applicant][:full_name].to_s
  ref_no
end

def choose_random_address_type
  # Select "lookup" addresses, or manually entering addresses at random.
  # Lookup is more common.
  i = rand(0..2)
  return "lookup" unless i == 2

  "manual"
end

def choose_random_site_type
  # Randomly select whether the site is entered as a grid reference or address.
  i = rand(0..1)
  return "grid_ref" unless i == 1

  "address"
end

def add_unsubmitted_registration(registration, load_root_page = true, address_type = "random")
  @world.journey.home_page.load if load_root_page
  @world.journey.registration_type_page.submit(start_option: :new_radio)
  @world.journey.location_page.submit(location: :england)
  @world.journey.choose_exemptions_page.submit(exemptions: registration[:exemptions])

  complete_applicant_details(registration[:applicant])
  complete_organisation_details(registration, address_type)
end

def continue_unsubmitted_registration(registration, address_type = "random", site_type = "random")
  complete_contact_details(registration[:contact], address_type)
  complete_farm_questions(registration)
  complete_site_details(registration, address_type, site_type)
  ref_no = complete_confirmations
  puts ref_no + " completed"
  ref_no
end

def complete_applicant_details(person)
  @world.journey.name_page.submit(first_name: person[:first_name], last_name: person[:last_name])
  @world.journey.phone_page.submit(tel_no: person[:telephone])
  @world.journey.email_page.submit(email: person[:email], confirm_email: person[:email])
end

def complete_organisation_details(registration, address_type)
  @world.journey.business_type_page.submit(business_type: registration[:business_type])

  case registration[:business_type]
  when :limited_company
    @world.journey.registration_number_page.submit(
      registration_number: registration[:registration_number]
    )
  when :llp
    @world.journey.registration_number_page.submit(
      registration_number: registration[:registration_number]
    )
  when :partnership
    complete_partner_details(registration)
  end

  complete_operator_name_and_address(registration, address_type)
end

def complete_address(address_type)
  # Select a random address type each time - lookup or manual.
  # Lookup is more common so this happens two out of three times.
  address_type = choose_random_address_type if address_type == "random"
  if address_type == "lookup" # get address via postcode lookup
    @world.journey.address_lookup_page.submit(
      postcode: "BS1 5AH",
      result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
    )
  else # address is populated manually
    @world.journey.address_lookup_page.choose_manual_address(
      postcode: "BS1 5AH"
    )
    @world.journey.address_manual_page.wait_until_house_no_visible
    expect(@world.journey.address_manual_page.heading).to have_no_text("{")
    @world.journey.address_manual_page.submit_manual_address(
      house_no: rand(1..99_999).to_s,
      address_line_one: "Manually entered road",
      address_line_two: "Manually entered area",
      city: "Manualton"
    )
  end
end

def complete_operator_name_and_address(registration, address_type)
  @world.journey.operator_name_page.submit(org_name: registration[:operator_name])
  complete_address(address_type)
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

def complete_contact_details(person, address_type)
  @world.journey.name_page.submit(first_name: person[:first_name], last_name: person[:last_name])
  @world.journey.contact_position_page.submit(position: person[:position])
  @world.journey.phone_page.submit(tel_no: person[:telephone])
  @world.journey.email_page.submit(email: person[:email], confirm_email: person[:email])
  complete_address(address_type)
end

def complete_farm_questions(registration)
  @world.journey.on_farm_page.submit(on_farm: registration[:on_farm])
  @world.journey.farmer_page.submit(farmer: registration[:farmer])
end

def complete_site_details(registration, address_type = "lookup", site_type = "grid_ref")
  site_type = choose_random_site_type if site_type == "random"
  if site_type == "grid_ref" # the site is at a grid reference
    @world.journey.site_grid_reference_page.submit(
      grid_ref: registration[:site][:grid_ref],
      site_details: registration[:site][:site_details]
    )
  else # the site is at an address
    find_link("use an address instead").click
    complete_address(address_type)
  end
end

def complete_confirmations
  @world.journey.check_details_page.submit
  @world.journey.declaration_page.submit

  # Return the reference number of the registration that was just completed:
  @world.journey.confirmation_page.ref_no.text
end
