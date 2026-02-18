# frozen_string_literal: true

class CheckDetailsPage < BasePage

  element(:business_type, "#change_site_details")
  element(:operator_name, "#operator_operator_name")
  element(:company_name, "#operator_registered_name")
  element(:change_operator_name, "a[href='check-your-answers/operator-name'")
  element(:partner_details, "#operator_partners")
  element(:change_partner_details, "a[href='check-your-answers/main-people'")
  element(:companies_house_number, "#operator_companies_house_number")
  element(:change_companies_house_number, "a[href='check-your-answers/registration-number']")
  element(:place_of_business, "#operator_place_of_business")
  element(:operator_address, "#operator_address")
  element(:change_operator_address,
          "a[href='check-your-answers/operator-address'],a[href='renewal-start/operator-address']")
  element(:contact_name, "#operator_contact_name")
  element(:change_contact_name, "a[href='check-your-answers/contact-name'], a[href='renewal-start/contact-name']")
  element(:contact_position, "#operator_contact_position")
  element(:change_contact_position,
          "a[href='check-your-answers/contact-position'],a[href='renewal-start/contact-position']")
  element(:contact_address, "#contact_address")
  element(:change_contact_address,
          "a[href='check-your-answers/contact-address'],a[href='renewal-start/contact-address']")
  element(:contact_email, "#operator_contact_email_address")
  element(:change_contact_email, "a[href='check-your-answers/contact-email'], a[href='renewal-start/contact-email']")
  element(:contact_tel, "#operator_contact_telephone_number")
  element(:change_contact_tel, "a[href='check-your-answers/contact-phone'],a[href='renewal-start/contact-phone']")
  element(:exemptions, "#registration_exemptions")
  element(:change_exemptions, "a[href='check-your-answers/exemptions'],a[href='renewal-start/exemptions']")
  element(:on_farm, "#registration_will_this_waste_operation_take_place_on_a_farm")
  element(:change_on_farm, "a[href='check-your-answers/on-a-farm'],a[href='renewal-start/on-a-farm']")
  element(:farmer, "#registration_are_the_waste_exemptions_used_by_a_farmer_or_farming_business")
  element(:change_farmer, "a[href='check-your-answers/is-a-farmer'],a[href='renewal-start/is-a-farmer']")
  element(:grid_ref, "#registration_grid_reference")
  element(:site_desc, "#registration_site_description")
  element(:site_address, "#registration_site_address")
  element(:change_site_address, "a[href='check-your-answers/check-site-address']")
  elements(:change_site_location, "a[href='check-your-answers/site-grid-reference']")
  element(:change_sites, "a[href='check-your-answers/sites']")

  def exemptions_displayed?(expected_text)
    page_text = exemptions.text
    return false if page_text.include?("Error")

    # Assume message contains all expected text unless proven otherwise:
    contains_all_text = true

    expected_text.each do |element|
      unless page_text.include?(element)
        contains_all_text = false
        break
      end
    end

    return true if contains_all_text

    puts "Couldn't find all exemptions: #{expected_text}"
    false
  end

end
