# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class App
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # FRONT OFFICE SPECIFIC PAGES
  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  # JOURNEY PAGES

  def address_page
    @last_page = AddressPage.new
  end

  def add_partner_page
    @last_page = AddPartnerPage.new
  end

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

  def choose_exemptions_page
    @last_page = ChooseExemptionsPage.new
  end

  def check_details_page
    @last_page = CheckDetailsPage.new
  end

  def company_name_page
    @last_page = CompanyNamePage.new
  end

  def company_number_page
    @last_page = CompanyNumberPage.new
  end

  def confirmation_page
    @last_page = ConfirmationPage.new
  end

  def correspondence_contact_page
    @last_page = CorrespondenceContactPage.new
  end

  def declaration_page
    @last_page = DeclarationPage.new
  end

  def farm_questions_page
    @last_page = FarmQuestionsPage.new
  end

  def location_page
    @last_page = LocationPage.new
  end

  def organisation_name_page
    @last_page = OrganisationNamePage.new
  end

  def registration_type_page
    @last_page = RegistrationTypePage.new
  end

  # /wec/enrollments/reviewing_partners
  def reviewing_partners_page
    @last_page = ReviewingPartnersPage.new
  end

  def site_location_page
    @last_page = SiteLocationPage.new
  end

  # BACK OFFICE SPECIFIC PAGES
  # /
  def back_office_home_page
    @last_page = BackOfficeHomePage.new
  end

  def confirmation_letter_bulk_exports_page
    @last_page = ConfirmationLetterBulkExportsPage.new
  end

  # /admin/enrollments/[id]/deregistration/new
  def deregister_registration_page
    @last_page = DeregisterRegistrationPage.new
  end

  # /admin/enrollment_exemptions/[id]/edit_deregister
  def deregister_exemption_page
    @last_page = DeregisterExemptionPage.new
  end

  # /admin/enrollment_exports
  def enrollment_exports_page
    @last_page = EnrollmentExportsPage.new
  end

  # / (when not signed in)
  def login_page
    @last_page = LoginPage.new
  end

  # /admin/enrollments/[id]
  def registration_page
    @last_page = RegistrationPage.new
  end

  # / (once signed in)
  def search_page
    @last_page = SearchPage.new
  end

end
