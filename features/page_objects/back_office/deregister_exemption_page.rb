require_relative "../sections/admin_nav_bar_section"

class DeregisterExemptionPage < SitePrism::Page

  element(:reason_dropdown, "#admin_deregister_enrollment_exemption_form_status")
  element(:revoked_option, "option[value='revoked']")
  element(:ceased_option, "option[value='ceased']")

  element(:comment, "#admin_deregister_enrollment_exemption_form_deregistered_comment")

  element(:deregister_button, "input[name='commit']")

  section(:nav_bar, AdminNavBarSection, AdminNavBarSection::SELECTOR)

  def submit(args = {})
    case args[:reason]
    when :cease
      ceased_option.select_option
    when :revoke
      revoked_option.select_option
    end

    comment.set(args[:comment]) if args.key?(:comment)

    deregister_button.click
  end

end
