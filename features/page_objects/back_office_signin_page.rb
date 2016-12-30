class BackOfficeSigninPage < SitePrism::Page

  set_url("https://admin-we-qa.envage.co.uk")

  element(:user_email, "input[id='user_email']")
  element(:user_password, "input[id='user_password']")

  element(:submit_button, "input[name='commit']")

  def sign_in(args = {})
    user_email.set(args[:user_email]) if args.key?(:user_email)
    user_password.set(args[:user_password]) if args.key?(:user_password)
    submit_button.click
  end

end
