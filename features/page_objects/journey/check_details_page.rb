# frozen_string_literal: true

class CheckDetailsPage < BasePage

  element(:business_type, "#change_site_details")
  element(:operator_name, "#company_operator_name")
  element(:companies_house_number, "#company_companies_house_number")
  element(:place_of_business, "#company_place_of_business")
  element(:company_address, "#company_address")
  element(:contact_name, "#company_contact_name")
  element(:contact_address, "#company_contact_address")
  element(:contact_details, "#company_contact_details")
  element(:exemptions, "#registration_exemptions")
  element(:on_farm, "#registration_will_this_waste_operation_take_place_on_a_farm")
  element(:farmer, "#registration_are_the_waste_exemptions_used_by_a_farmer_or_farming_business")
  element(:applicant_name, "#registration_form_completed_by")
  element(:applicant_tel, "#registration_telephone_number")
  element(:applicant_email, "#registration_email_address")
  element(:grid_ref, "#registration_grid_reference")
  element(:site_desc, "#registration_site_description")
  element(:site_address, "#registration_site_address")

end
