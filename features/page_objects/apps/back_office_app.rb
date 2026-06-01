# frozen_string_literal: true

# Represents all pages in the registration journey. Was created to avoid needing
# to create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class BackOfficeApp
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page, :base_page

  def accept_page
    @last_page = AcceptPage.new
  end

  def change_user_role_page
    @last_page = ChangeUserRolePage.new
  end

  def confirmation_letter_page
    @last_page = ConfirmationLetterPage.new
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

  def edit_page
    @last_page = EditPage.new
  end

  def edit_reason_page
    @last_page = EditReasonPage.new
  end

  def edit_details_page
    @last_page = EditDetailsPage.new
  end

  def exemptions_page
    @last_page = ExemptionsPage.new
  end

  def extend_expiry_date_page
    @last_page = ExtendExpiryDatePage.new
  end

  def invitation_page
    @last_page = InvitationPage.new
  end

  def login_page
    @last_page = LoginPage.new
  end

  def linear_registrations_page
    @last_page = LinearRegistrationsPage.new
  end

  def registration_complete_page
    @last_page = RegistrationCompletePage.new
  end

  def registration_details_page
    @last_page = RegistrationDetailsPage.new
  end

  def resend_letter_page
    @last_page = ResendLetterPage.new
  end

  def users_page
    @last_page = UsersPage.new
  end

  def change_history_page
    @last_page = ChangeHistoryPage.new
  end

  def communication_log_page
    @last_page = CommunicationLogPage.new
  end

  def communication_history_page
    @last_page = CommunicationHistoryPage.new
  end

  def deregistration_details_page
    @last_page = DeregistrationDetailsPage.new
  end

  def payment_details_page
    @last_page = PaymentDetailsPage.new
  end

  def record_payment_page
    @last_page = RecordPaymentPage.new
  end

  def record_refund_page
    @last_page = RecordRefundPage.new
  end

  def record_reversal_page
    @last_page = RecordReversalPage.new
  end

  def sites_page
    @last_page = SitesPage.new
  end

  def charge_adjustment_type_page
    @last_page = ChargeAdjustmentTypePage.new
  end

  def charge_adjustment_page
    @last_page = ChargeAdjustmentPage.new
  end

end
