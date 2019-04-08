# frozen_string_literal: true

# Represents all pages in the registration journey. Was created to avoid needing
# to create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class BackOfficeApp
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  def accept_page
    @last_page = AcceptPage.new
  end

  def change_user_role_page
    @last_page = ChangeUserRolePage.new
  end

  def deregister_page
    @last_page = DeregisterPage.new
  end

  def dashboard_page
    @last_page = DashboardPage.new
  end

  def deactivate_user_page
    @last_page = DeactivateUserPage.new
  end

  def invitation_page
    @last_page = InvitationPage.new
  end

  def login_page
    @last_page = LoginPage.new
  end

  def registration_complete_page
    @last_page = RegistrationCompletePage.new
  end

  def registration_details_page
    @last_page = RegistrationDetailsPage.new
  end

  def users_page
    @last_page = UsersPage.new
  end
end
