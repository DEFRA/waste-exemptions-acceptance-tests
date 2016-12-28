class DeregistrationPage < SitePrism::Page

  element(:deregister_status_dropdown, '#admin_deregister_enrollment_form_reason')
  element(:revoked_option, "option[value='revoked']")
  element(:ceased_option, "option[value='ceased']")
  element(:deregistration_comment, '#admin_deregister_enrollment_form_comment')

  element(:deregister_button, "input[name='commit']")

  def revoke(args = {})
    deregister_status_dropdown.click
    revoked_option.click
    deregistration_comment.set(args[:deregistration_comment]) if args.key?(:deregistration_comment)

    deregister_button.click
   end

end
