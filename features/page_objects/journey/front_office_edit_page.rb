# frozen_string_literal: true

class FrontOfficeEditPage < BasePage
  element(:change_exemptions_link, 'a[href$="/fo_edit/exemptions"]')
  element(:change_contact_email_link, 'a[href$="/fo_edit/contact_email"]')
  element(:change_contact_name_link, 'a[href$="/fo_edit/contact_name"]')
  element(:change_contact_phone_link, 'a[href$="/fo_edit/contact_phone"]')
end
