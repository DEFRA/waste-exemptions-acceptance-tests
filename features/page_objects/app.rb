# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
# rubocop:disable Metrics/ClassLength
class App
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # FRONT OFFICE SPECIFIC PAGES
  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  # JOURNEY PAGES
  def applicant_email_page
    @last_page = ApplicantEmailPage.new
  end

  def applicant_phone_page
    @last_page = ApplicantPhonePage.new
  end

  def applicant_name_page
    @last_page = ApplicantNamePage.new
  end

  def business_type_page
    @last_page = BusinessTypePage.new
  end

  def contact_email_page
    @last_page = ContactEmailPage.new
  end

  def contact_name_page
    @last_page = ContactNamePage.new
  end

  def contact_position_page
    @last_page = ContactPositionPage.new
  end

  def contact_telephone_page
    @last_page = ContactTelephonePage.new
  end

  def choose_exemptions_page
    @last_page = ChooseExemptionsPage.new
  end

  def check_details_page
    @last_page = CheckDetailsPage.new
  end

  def contact_address_page
    @last_page = ContactAddressPage.new
  end

  def company_name_page
    @last_page = CompanyNamePage.new
  end

  def confirmation_page
    @last_page = ConfirmationPage.new
  end

  def declaration_page
    @last_page = DeclarationPage.new
  end

  def farmer_page
    @last_page = FarmerPage.new
  end

  def location_page
    @last_page = LocationPage.new
  end

  def main_people_page
    @last_page = MainPeoplePage.new
  end

  def operator_name_page
    @last_page = OperatorNamePage.new
  end

  def operator_address_page
    @last_page = OperatorAddressPage.new
  end

  def on_farm_page
    @last_page = OnFarmPage.new
  end

  def registration_type_page
    @last_page = RegistrationTypePage.new
  end

  def registration_number_page
    @last_page = RegistrationNumberPage.new
  end

  def register_in_wales_page
    @last_page = RegisterInWalesPage.new
  end

  def reviewing_partners_page
    @last_page = ReviewingPartnersPage.new
  end

  def site_grid_reference_page
    @last_page = SiteGridReferencePage.new
  end

  def site_address_page
    @last_page = SiteAddressPage.new
  end

  # BACK OFFICE SPECIFIC PAGES
  # /
  def back_office_home_page
    @last_page = BackOfficeHomePage.new
  end

  def confirmation_letter_bulk_exports_page
    @last_page = ConfirmationLetterBulkExportsPage.new
  end

  def deregister_registration_page
    @last_page = DeregisterRegistrationPage.new
  end

  def deregister_exemption_page
    @last_page = DeregisterExemptionPage.new
  end

  def enrollment_exports_page
    @last_page = EnrollmentExportsPage.new
  end

  def login_page
    @last_page = LoginPage.new
  end

  def registration_dashboard_page
    @last_page = RegistrationDashboardPage.new
  end

  def search_page
    @last_page = SearchPage.new
  end

  def users_page
    @last_page = UsersPage.new
  end
  # rubocop:enable Metrics/ClassLength
end
