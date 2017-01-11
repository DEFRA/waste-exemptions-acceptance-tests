
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
  def registration_type_page
    @last_page = RegistrationTypePage.new
  end

  def contact_details_page
    @last_page = ContactDetailsPage.new
  end

  def user_type_page
    @last_page = UserTypePage.new
  end

  def organisation_name_page
    @last_page = OrganisationNamePage.new
  end

  def company_number_page
    @last_page = CompanyNumberPage.new
  end

  def company_name_page
    @last_page = CompanyNamePage.new
  end

  def address_page
    @last_page = AddressPage.new
  end

  def correspondence_contact_page
    @last_page = CorrespondenceContactPage.new
  end

  def farm_questions_page
    @last_page = FarmQuestionsPage.new
  end

  def site_location_page
    @last_page = SiteLocationPage.new
  end

  def choose_exemptions_page
    @last_page = ChooseExemptionsPage.new
  end

  def check_details_page
    @last_page = CheckDetailsPage.new
  end

  def declaration_page
    @last_page = DeclarationPage.new
  end

  def confirmation_page
    @last_page = ConfirmationPage.new
  end

  # BACK OFFICE SPECIFIC PAGES
  # /
  def back_office_home_page
    @last_page = BackOfficeHomePage.new
  end

  # / (when not signed in)
  def login_page
    @last_page = LoginPage.new
  end

  # / (once signed in)
  def search_page
    @last_page = SearchPage.new
  end

  # /admin/enrollments/[id]
  def registration_page
    @last_page = RegistrationPage.new
  end

  # /admin/enrollments/[id]/deregistration/new
  def deregister_registration_page
    @last_page = DeregisterRegistrationPage.new
  end

  # /admin/enrollment_exemptions/[id]/edit_deregister
  def deregister_exemption_page
    @last_page = DeregisterExemptionPage.new
  end

end
