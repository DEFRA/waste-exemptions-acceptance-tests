class DeregistrationPage < SitePrism::Page

  element(:deregister_status_dropdown, "#admin_deregister_enrollment_exemption_form_status")
  element(:revoked_option, "option[value='revoked']")
  element(:ceased_option, "option[value='ceased']")
  element(:reg_dereg_comment, "#admin_deregister_enrollment_form_comment")
  element(:exemption_dereg_comment, "#admin_deregister_enrollment_exemption_form_deregistered_comment")

  element(:deregister_button, "input[name='commit']")

  section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

  def deregister_registration(args = {})
    case args[:reason]
    when :cease
      ceased_option.select_option
    when :revoke
      revoked_option.select_option
    end

    reg_dereg_comment.set(args[:reg_dereg_comment]) if args.key?(:reg_dereg_comment)

    deregister_button.click
  end

  def deregister_exemption(args = {})
    case args[:reason]
    when :cease
      ceased_option.select_option
    when :revoke
      revoked_option.select_option
    end

    exemption_dereg_comment.set(args[:exemption_dereg_comment]) if args.key?(:exemption_dereg_comment)

    deregister_button.click
  end

end
