class DeregistrationPage < SitePrism::Page

  element(:deregister_status_dropdown, "#admin_deregister_enrollment_exemption_form_status")
  element(:revoked_option, "option[value='revoked']")
  element(:ceased_option, "option[value='ceased']")
  element(:deregistration_comment, "#admin_deregister_enrollment_form_comment")

  element(:deregister_button, "input[name='commit']")

  def submit(args = {})
    case args[:reason]
    when :cease
      ceased_option.select_option
    when :revoke
      revoked_option.select_option
    end

    deregistration_comment.set(args[:deregistration_comment]) if args.key?(:deregistration_comment)

    deregister_button.click
  end

end
