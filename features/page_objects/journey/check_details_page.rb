# frozen_string_literal: true

class CheckDetailsPage < BasePage

  element(:business_type, "#change_site_details")
  element(:operator_name, "#company_operator_name")
  element(:company_name, "#company_registered_name")
  element(:change_operator_name, "a[href='check-your-answers/operator-name'")
  element(:partner_details, "#company_partners")
  element(:change_partner_details, "a[href='check-your-answers/main-people'")
  element(:companies_house_number, "#company_companies_house_number")
  element(:change_companies_house_number, "a[href='check-your-answers/registration-number']")
  element(:place_of_business, "#company_place_of_business")
  element(:company_address, "#company_address")
  element(:change_company_address,
          "a[href='check-your-answers/operator-address'],a[href='renewal-start/operator-address']")
  element(:contact_name, "#company_contact_name")
  element(:change_contact_name, "a[href='check-your-answers/contact-name'], a[href='renewal-start/contact-name']")
  element(:contact_position, "#company_contact_position")
  element(:change_contact_position,
          "a[href='check-your-answers/contact-position'],a[href='renewal-start/contact-position']")
  element(:contact_address, "#company_contact_address")
  element(:change_contact_address,
          "a[href='check-your-answers/contact-address'],a[href='renewal-start/contact-address']")
  element(:contact_email, "#company_contact_email_address")
  element(:change_contact_email, "a[href='check-your-answers/contact-email'], a[href='renewal-start/contact-email']")
  element(:contact_tel, "#company_contact_telephone_number")
  element(:change_contact_tel, "a[href='check-your-answers/contact-phone'],a[href='renewal-start/contact-phone']")
  element(:exemptions, "#registration_exemptions")
  element(:change_exemptions, "a[href='check-your-answers/exemptions'],a[href='renewal-start/exemptions']")
  element(:on_farm, "#registration_will_this_waste_operation_take_place_on_a_farm")
  element(:change_on_farm, "a[href='check-your-answers/on-a-farm']")
  element(:farmer, "#registration_are_the_waste_exemptions_used_by_a_farmer_or_farming_business")
  element(:change_farmer, "a[href='check-your-answers/is-a-farmer']")
  element(:applicant_name, "#registration_form_completed_by")
  element(:change_applicant_name, "a[href='check-your-answers/applicant-name'],a[href='renewal-start/applicant-name']")
  element(:applicant_tel, "#registration_telephone_number")
  element(:change_applicant_tel, "a[href='check-your-answers/applicant-phone'],a[href='renewal-start/applicant-phone']")
  element(:applicant_email, "#registration_email_address")
  element(:change_applicant_email,
          "a[href='check-your-answers/applicant-email'],a[href='renewal-start/applicant-email']")
  element(:grid_ref, "#registration_grid_reference")
  element(:site_desc, "#registration_site_description")
  element(:site_address, "#registration_site_address")
  element(:change_site_address, "a[href='check-your-answers/check-site-address']")
  elements(:change_site_location, "a[href='check-your-answers/site-grid-reference']")
end
