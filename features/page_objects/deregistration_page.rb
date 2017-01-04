class DeregistrationPage < SitePrism::Page

  element(:deregister_status_dropdown, "#admin_deregister_enrollment_exemption_form_status")
  element(:revoked_option, "option[value='revoked']")
  element(:ceased_option, "option[value='ceased']")
  element(:registration_deregistration_comment, "#admin_deregister_enrollment_form_comment")
  element(:exemption_deregistration_comment, "#admin_deregister_enrollment_exemption_form_deregistered_comment")
  
  element(:deregister_button, "input[name='commit']")

  section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

  def deregister_registration(args = {})
    case args[:reason]
    when :cease
      ceased_option.select_option
    when :revoke
      revoked_option.select_option
    end

    registration_deregistration_comment.set(args[:registration_deregistration_comment]) if args.key?(:registration_deregistration_comment)

    deregister_button.click
  end

    def deregister_exemption(args = {})
    case args[:reason]
    when :cease
      ceased_option.select_option
    when :revoke
      revoked_option.select_option
    end

    exemption_deregistration_comment.set(args[:exemption_deregistration_comment]) if args.key?(:exemption_deregistration_comment)

    deregister_button.click
  end

end
