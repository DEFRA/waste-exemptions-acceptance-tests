
# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class App
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  def back_office_home_page
    @last_page = BackOfficeHomePage.new
  end

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

  def back_office_signin_page
    @last_page = BackOfficeSigninPage.new
  end

  def registration_details_page
    @last_page = RegistrationDetailsPage.new
  end

  def deregistration_page
    @last_page = DeregistrationPage.new
  end

end
