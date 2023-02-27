# frozen_string_literal: true

# Represents all pages in the registration journey. Was created to avoid needing
# to create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
# rubocop:disable  Metrics/ClassLength
class JourneyApp
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page, :base_page

  def home_page
    @last_page = HomePage.new
  end

  def address_lookup_page
    @last_page = AddressLookupPage.new
  end

  def address_manual_page
    @last_page = AddressManualPage.new
  end

  def ad_privacy_policy_page
    @last_page = AdPrivacyPolicyPage.new
  end

  def business_type_page
    @last_page = BusinessTypePage.new
  end

  def confirm_edit_exemptions_page
    @last_page = ConfirmEditExemptionsPage.new
  end

  def contact_position_page
    @last_page = ContactPositionPage.new
  end

  def choose_exemptions_page
    @last_page = ChooseExemptionsPage.new
  end

  def check_contact_phone_page
    @last_page = CheckContactPhonePage.new
  end

  def check_contact_email_page
    @last_page = CheckContactEmailPage.new
  end

  def check_contact_address_page
    @last_page = CheckContactAddressPage.new
  end

  def check_contact_name_page
    @last_page = CheckContactNamePage.new
  end

  def check_site_address_page
    @last_page = CheckSiteAddressPage.new
  end

  def check_details_page
    @last_page = CheckDetailsPage.new
  end

  def check_registered_company_name_page
    @last_page = CheckRegisteredCompanyNamePage.new
  end

  def confirmation_page
    @last_page = ConfirmationPage.new
  end

  def declaration_page
    @last_page = DeclarationPage.new
  end

  def email_page
    @last_page = EmailPage.new
  end

  def farmer_page
    @last_page = FarmerPage.new
  end

  def last_message_page
    @last_page = LastMessagePage.new
  end

  def location_page
    @last_page = LocationPage.new
  end

  def name_page
    @last_page = NamePage.new
  end

  def operator_name_page
    @last_page = OperatorNamePage.new
  end

  def on_farm_page
    @last_page = OnFarmPage.new
  end

  def partners_page
    @last_page = PartnersPage.new
  end

  def phone_page
    @last_page = PhonePage.new
  end

  def registration_type_page
    @last_page = RegistrationTypePage.new
  end

  def registration_number_page
    @last_page = RegistrationNumberPage.new
  end

  def renew_choice_page
    @last_page = RenewChoicePage.new
  end

  def renew_splash_page
    @last_page = RenewSplashPage.new
  end

  def reviewing_partners_page
    @last_page = ReviewingPartnersPage.new
  end

  def site_grid_reference_page
    @last_page = SiteGridReferencePage.new
  end

  def can_not_renew_type_page
    @last_page = CanNotRenewTypePage.new
  end

  def renew_no_exemptions_page
    @last_page = RenewNoExemptionsPage.new
  end

end
# rubocop:enable  Metrics/ClassLength
