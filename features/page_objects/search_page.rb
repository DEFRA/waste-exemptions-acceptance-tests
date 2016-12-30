class SearchPage < SitePrism::Page

  element(:menu_home, :xpath, "html/body/header/div/div/a[2]")
  element(:menu_registrations, :xpath, "html/body/header/div/nav/ul/li[1]/a")
  element(:menu_search, :xpath, "html/body/header/div/nav/ul/li[1]/ul/li[1]/a")
  element(:menu_new_registration, :xpath, "html/body/header/div/nav/ul/li[1]/ul/li[2]/a")
  element(:sign_out, :xpath, "html/body/header/div/nav/ul/li[3]/a")

  element(:alert_signed_in, "div.alert-success[role='alert']", text: "successfully signed in")
  element(:alert_deregister, "div.alert-success[role='alert']", text: "Enrollment deregistered successfully")

  element(:search_field, "input#search")
  element(:search_status_dropdown, "select#search_status")
  element(:search_submitted, "#stage_submitted")
  element(:search_not_submitted, "#stage_not_submitted")
  element(:search_all, "#stage_all")

  element(:search_button, ".btn-success")

  element(:first_search_result, ".h4 > a:first-child")

  def submit(args = {})
    search_field.set(args[@exemption_number]) if args.key?(@exemption_number)
    select_search(args[:type])

    search_button.click
  end

  private

  def select_search(type)
    case type
    when :search_submitted
      search_submitted.click
    when :search_not_submitted
      search_not_submitted.click
    when :search_all
      search_all.click
    end
  end

end
