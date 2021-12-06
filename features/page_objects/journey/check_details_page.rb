# frozen_string_literal: true

class CheckDetailsPage < BasePage

  # Contact details
  element(:change_contact_name, "table[id='reviewing-change-yourcontactdetails-yourname']")
  element(:change_tel_no, "table[id='reviewing-change-yourcontactdetails-yourbusinesstelephonenumber']")
  element(:change_email, "table[id='reviewing-change-yourcontactdetails-yourbusinessemail']")

  # Business details
  element(
    :change_person_responsible,
    "table[id='reviewing-change-businessdetails-personresponsibleforthewasteoperation']"
  )
  element(
    :change_person_responsible_address,
    "table[id='reviewing-change-businessdetails-addressofthepersonresponsible']"
  )

  # Waste operation contact details
  element(:change_waste_contact_name, "table[id='reviewing-change-wasteoperationcontact-name']")
  element(:change_waste_contact_tel_no, "table[id='reviewing-change-wasteoperationcontact-telephonenumber']")
  element(:change_waste_contact_address, "table[id='reviewing-change-wasteoperationcontact-address']")
  element(:change_waste_contact_email, "table[id='reviewing-change-wasteoperationcontact-email']")

  # Waste operation details
  element(:change_grid_ref, "table[id='reviewing-change-wasteoperationdetails-gridreference']")
  element(:change_site_details, "table[id='reviewing-change-wasteoperationdetails-sitedetails']")
  element(:change_site_details, "table[id='reviewing-change-wasteoperationdetails-sitedetails']")

  def submit(args = {})
    exemptions.find { |chk| chk["value"] == args[:exemption] }.click if args.key?(:exemption)

    submit_button.click
  end

end
